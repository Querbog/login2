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
  String? imageDownloadURL; // Store the image download URL
  String? dateTime = DateTime.now().toString();

  bool _isLoading = false;

  Future<void> getImage() async {
    fetchLocationAndPlaceDetails();
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to pick image'),
          ),
        );
        return;
      }

      setState(() {
        _image = File(image.path);
      });

      // Upload image and get download URL
      imageDownloadURL = await uploadImageToStorage(_image!);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image $e'),
        ),
      );
    }
  }

  Future<String?> uploadImageToStorage(File imageFile) async {
    try {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('Pothole images')
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      print('Image uploaded successfully. Download URL: $downloadURL');
      return downloadURL;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error uploading image to Firebase Storage'),
        ),
      );
      return "";
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
        streetName = placemarks[0].street;
        cityName = placemarks[0].locality;
        stateName = placemarks[0].administrativeArea;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Turn on location permissions'),
        ),
      );
    }
  }

  @override
  void initState() {
    fetchLocationAndPlaceDetails();
    super.initState();
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
                ? Image.file(_image!, fit: BoxFit.cover,width: 350.0,height: 400.0,)
                : Image.network(
                    'https://thumbs.dreamstime.com/b/businessman-jumping-over-pothole-business-concept-illustration-91263396.jpg'),
            Button(
                title: 'Capture Pot-Hole',
                colour: Colors.lightBlueAccent,
                onPressed: getImage),
            Text('Latitude: ${latitude ?? "Loading..."}'),
            Text('Longitude: ${longitude ?? "Loading..."}'),
            Text('Date : $dateTime'),
            // Text('Street: ${streetName ?? "Loading..."}'),
            // Text('City: ${cityName ?? "Loading..."}'),
            // Text('State: ${stateName ?? "Loading..."}'),
            _isLoading
                ? const CircularProgressIndicator()
                : Button(
                    title: 'Report Pot-Hole',
                    colour: Colors.lightBlueAccent,
                    onPressed: () async {
                      // Check if imageDownloadURL is available
                      if (_image == null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please click an image...'),
                          ),
                        );
                        return;
                      }
                      if (imageDownloadURL != null) {
                        setState(() {
                          _isLoading = true; // Set loading state
                        });
                        ReportedPothole newPotHole = ReportedPothole(
                          imageUrl: imageDownloadURL!,
                          lat : latitude!,
                          long : longitude!,
                            dateTime :dateTime!
                          // streetName: streetName!,
                          // cityName: cityName!,
                          // stateName: stateName!,
                        );

                        // Simulate a delay for demonstration purposes
                        await Future.delayed(const Duration(seconds: 2));

                        // Navigate back to HomeScreen and pass the new pothole
                        Get.back(result: newPotHole);

                        setState(() {
                          _isLoading = false; // Reset loading state
                        });
                      } else {
                        // Show a message or handle the case where imageDownloadURL is null
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Image is uploading....'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }
                    }),
          ],
        ),
      ),
    );
  }
}
