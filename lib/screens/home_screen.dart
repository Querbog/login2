import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login2/screens/image_screen.dart';
import 'package:login2/utilities/button.dart';
import 'package:login2/utilities/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Location loc = Location();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Report a problem here !!',
            style: TextStyle(fontSize: 25.0),
          ),
          Button(
              title: 'Report problem',
              colour: Colors.tealAccent,
              onPressed: (){
                loc.getCurrentLocation();
                Get.to(()=> ImageScreen());
              },
          )
        ],
      ),
    );
  }
}
