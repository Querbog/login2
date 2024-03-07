import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login2/screens/image_screen.dart';
import 'package:login2/screens/login_screen.dart';
import 'package:login2/utilities/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<QuerySnapshot> _potholesStream;

  @override
  void initState() {
    super.initState();
    // Fetch the list of reported potholes when the screen is initialized
    _potholesStream = FirebaseFirestore.instance.collection('potholes').snapshots();
  }

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
            flex: 4,
            child: StreamBuilder<QuerySnapshot>(
              stream: _potholesStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching data'));
                }
                final potholes = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: potholes.length,
                  itemBuilder: (context, index) {
                    final data = potholes[index].data() as Map<String, dynamic>;
                    return Card(
                      child: ListTile(
                        title: Text(
                          'Street: ${data['streetName']},\nCity: ${data['cityName']},\nState: ${data['stateName']}',
                        ),
                        subtitle: Image.network(
                          data['imageUrl'],
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
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
                    // Add new pothole to Firestore
                    await FirebaseFirestore.instance.collection('potholes').add({
                      'imageUrl': newPotHole.imageUrl,
                      'streetName': newPotHole.streetName,
                      'cityName': newPotHole.cityName,
                      'stateName': newPotHole.stateName,
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
