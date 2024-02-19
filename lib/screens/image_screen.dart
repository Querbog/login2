import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login2/screens/report_pothole.dart';
import 'package:login2/utilities/button.dart';
import 'package:login2/utilities/location.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key, this.imageURL}) : super(key: key);

  final String? imageURL;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File? _image;
  String? streetName;
  String? cityName;
  String? stateName;
  double? latitude;
  double? longitude;
  late String imageDownloadURL; // Store the image download URL

  Future<void> getImage() async {
    fetchLocationAndPlaceDetails();
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      setState(() {
        _image = File(image.path);
      });

      // Upload image and get download URL
      imageDownloadURL = await uploadImageToStorage(_image!);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    try {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('Pothole images')
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(DateTime.now().millisecondsSinceEpoch.toString() + '.jpg');

      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      print('Image uploaded successfully. Download URL: $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      throw e;
    }
  }

  Future<void> fetchLocationAndPlaceDetails() async {
    try {
      final location = LocationNew();
      await location.getCurrentLocation(); // Fetch current location
      setState(() {
        // Assign latitude and longitude values
        latitude = location.latitude;
        longitude = location.longitude;
      });
      List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude!, longitude!);
      setState(() {
        streetName = placemarks[0].thoroughfare;
        cityName = placemarks[0].locality;
        stateName = placemarks[0].administrativeArea;
      });
    } catch (e) {
      print('Error fetching location and place details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : Image.network(
                'https://thumbs.dreamstime.com/b/businessman-jumping-over-pothole-business-concept-illustration-91263396.jpg'),
            Button(
                title: 'Capture Pot-Hole',
                colour: Colors.grey,
                onPressed: getImage),
            Text('Street: ${streetName ?? "Loading..."}'),
            Text('City: ${cityName ?? "Loading..."}'),
            Text('State: ${stateName ?? "Loading..."}'),
            Button(
                title: 'Report Pot-Hole',
                colour: Colors.grey,
                onPressed: () async {
                  ReportedPothole newPotHole = ReportedPothole(
                    imageUrl: imageDownloadURL,
                    streetName: streetName!,
                    cityName: cityName!,
                    stateName: stateName!,
                  );

                  // Navigate back to HomeScreen and pass the new pothole
                  Get.back(result: newPotHole);
                })
          ],
        ),
      ),
    );
  }
}
