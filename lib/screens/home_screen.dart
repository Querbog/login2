import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login2/screens/image_screen.dart';
import 'package:login2/screens/login_screen.dart';
import 'package:login2/screens/report_pothole.dart';
import 'package:login2/utilities/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ReportedPothole>? reportedPotHoles = [];

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.back();
    Get.to(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome back!!'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Report a problem here !!',
            style: TextStyle(fontSize: 25.0),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: reportedPotHoles!.length,
              itemBuilder: (context, index) {
                ReportedPothole potHole = reportedPotHoles![index];
                return Card(
                  child: ListTile(
                    title: Text(
                        'Street: ${potHole.streetName},\nCity: ${potHole.cityName},\nState: ${potHole.stateName}'),
                    subtitle: Text('Image URL: ${potHole.imageUrl}'),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              child: Button(
                title: 'Report problem',
                colour: Colors.redAccent,
                onPressed: () async {
                  var newPotHole = await Get.to(() => ImageScreen());
                  if (newPotHole != null) {
                    setState(() {
                      reportedPotHoles!.add(newPotHole);
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
