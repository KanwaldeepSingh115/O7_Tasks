import 'package:flutter/material.dart';

class MyUI extends StatelessWidget {
  const MyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Trial - Assignment 7 June')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Button 1')),
                ElevatedButton(onPressed: () {}, child: Text('Button 2')),
                ElevatedButton(onPressed: () {}, child: Text('Button 3')),
              ],
            ),
            SizedBox(height: 20),

            Image.asset(
              'assets/myflutter.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            tileColor: Colors.grey,
                            title: Center(child: Text('List 1')),
                            dense: true,
                          ),
                          SizedBox(height: 10),
                          ListTile(
                            tileColor: Colors.grey,
                            title: Center(child: Text('List 2')),
                            dense: true,
                          ),
                          SizedBox(height: 10),
                          ListTile(
                            tileColor: Colors.grey,
                            title: Center(child: Text('List 3')),
                            dense: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    color: Colors.black,
                    width: 5,
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Button 4'),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Button 5'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
