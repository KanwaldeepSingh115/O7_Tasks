import 'package:flutter/material.dart';

class DrawerPro extends StatefulWidget {
  const DrawerPro({super.key});

  @override
  State<DrawerPro> createState() => _DrawerProState();
}

class _DrawerProState extends State<DrawerPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My App Bar')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                image: DecorationImage(
                  image: AssetImage('assets/image2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                'My Drawer',
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
            )
          ],
        ),
      ),
    );
  }
}
