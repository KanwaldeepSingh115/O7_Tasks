import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Task2July extends StatefulWidget {
  const Task2July({super.key});

  @override
  State<Task2July> createState() => _Task2JulyState();
}

class _Task2JulyState extends State<Task2July> {
  File? galleryFile;
  final picker = ImagePicker();

  void showPicker({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(() {
      if (xfilePick != null) {
        galleryFile = File(pickedFile!.path);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('No item is Selecetd')));
      }
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM_LEFT,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.cyanAccent,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector and Image Picker'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => showToast('On Tapped'),
                onDoubleTap: () => showToast('On Double Tapped'),
                onDoubleTapCancel: () => showToast('On Double Tapped Cancel'),
                onForcePressEnd: (details) => showToast('On Force Press End'),
                onDoubleTapDown:
                    (details) => showToast('On Double Tapped Down'),
                onLongPress: () => showToast('On Long Pressed'),
                onTapUp: (details) => showToast('On Tap Up'),
                onPanDown: (details) => showToast('On Pan Down'),
                onPanCancel: () => showToast('On Pan Cancel'),
                //onPanEnd: (details) => showToast('On Pan End'),
                onScaleEnd: (details) => showToast('On Scale End'),
                //onVerticalDragStart:
                //  (details) => showToast('On Vertical Drag Start'),
                onHorizontalDragStart:
                    (details) => showToast('On Horizontal Drag Start'),
                child: Container(
                  padding: EdgeInsets.all(36),
                  color: Colors.amber,
                  child: Text(
                    'Gesture Detector',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: 50),

              Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => showPicker(context: context),
                          child: Text(
                            'Pick an Image from the Chooser- Gallery or Camera',
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 500.0,
                          width: 300.0,
                          child:
                              galleryFile == null
                                  ? Center(child: Text('Nothing Selecetd!'))
                                  : Center(child: Image.file(galleryFile!)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
