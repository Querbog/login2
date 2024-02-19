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
            child: ListView.builder(
              itemCount: reportedPotHoles!.length,
              itemBuilder: (context, index) {
                ReportedPothole potHole = reportedPotHoles![index];
                return Card(
                  child: ListTile(
                    title: Text('Street: ${potHole.streetName}, \n City: ${potHole.cityName}, \n State: ${potHole.stateName}'),
                    subtitle: Text('Image URL: ${potHole.imageUrl}'),
                  ),
                );
              },
            ),
          ),
          Button(
            title: 'Report problem',
            colour: Colors.tealAccent,
            onPressed: () async {
              var newPotHole = await Get.to(() => ImageScreen());
              if (newPotHole != null) {
                setState(() {
                  reportedPotHoles!.add(newPotHole);
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
