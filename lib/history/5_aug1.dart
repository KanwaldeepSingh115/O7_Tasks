import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QR5Aug extends StatefulWidget {
  const QR5Aug({super.key});

  @override
  State<QR5Aug> createState() => _QR5AugState();
}

class _QR5AugState extends State<QR5Aug> {
  String qrData = 'This is Flutter QR Generator';

  final items = List.generate(12, (i) => 'Item $i');

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final marksController = TextEditingController();

  void disableScreenshot() async {
    final noScreenshot = NoScreenshot.instance;
    bool result = await noScreenshot.screenshotOff();
    debugPrint('Screenshot off: $result');
    Fluttertoast.showToast(
      msg: 'You cannot take screenshots of this page',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void initState() {
    super.initState();
    disableScreenshot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Generator')),
      body: Center(
        child: Column(
          children: [
            QrImageView(data: qrData, version: QrVersions.auto, size: 250),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  qrData = nameController.text;
                });
              },
              child: Text('Generate QR'),
            ),
          ],
        ),
      ),
    );
  }
}
