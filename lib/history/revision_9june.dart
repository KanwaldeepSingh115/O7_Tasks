import 'package:flutter/material.dart';
import 'package:o7_tasks/history/revision_9june2.dart';

class MainApp2 extends StatefulWidget {
  const MainApp2({super.key});

  @override
  State<MainApp2> createState() => _MainApp2State();
}

class _MainApp2State extends State<MainApp2> {
  int counter = 0;

  void incrementcounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Page'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: Icon(Icons.notifications),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Icon Clicked!')));
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You pushed the button $counter times'),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UiComponents9June()),
                );
              },
              child: Text('Go to Screen 2'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementcounter,
        tooltip: 'Increment Me',
        child: const Icon(Icons.add),
      ),
    );
  }
}
