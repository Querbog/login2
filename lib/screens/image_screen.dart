import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login2/utilities/button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File? _image;

  Future getImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      // final imageTemporary = File(image.path);
      final imagePermanent = await saveFile(image.path);

      setState(() {
        _image = imagePermanent;
      });
    }on PlatformException catch(e){
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFile(String imagePath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
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
                onPressed: getImage)
          ],
        ),
      ),
    );
  }
}
