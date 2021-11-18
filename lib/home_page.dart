import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Camera"),
      ),
      body: Center(
        child: _image == null
            ? const Text(
                "No Image",
                style: TextStyle(fontSize: 20.0),
              )
            : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionsDialogBox,
        child: const Icon(Icons.add_a_photo),
        tooltip: 'Open Camera',
      ),
    );
  }

/////////
  Future<void> _optionsDialogBox() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.lime,
            shape: const RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text(
                      "Take a Picture",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10,
                    ),
                    child: GestureDetector(
                      child: const Text(
                        "Select Image",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      onTap: openGallery,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
  }
}
