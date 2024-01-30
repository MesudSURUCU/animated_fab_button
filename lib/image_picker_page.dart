import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {

 File? _image;

 Future<void> _pickImage(ImageSource source) async {
  try {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if(pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  } catch (e) {
    debugPrint("Image picking failed: $e");
  }


 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null 
            ? Image.file(_image!)
            : const Text("Resim seçilmedi."),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            _pickImage(ImageSource.gallery);
          },
           child: const Text("Galeriden Resim Seç")),
           ElevatedButton(onPressed: (){
            _pickImage(ImageSource.camera);
          },
           child: const Text("Kameradan Resim Seç")),
          ],
        ),
      ),
    );
  }
}