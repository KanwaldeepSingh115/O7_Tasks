import 'package:flutter/material.dart';
import 'package:o7_tasks/history/revision_11june.dart';
import 'package:o7_tasks/history/revision_13june.dart';
import 'package:o7_tasks/history/revision_10june2.dart';
import 'package:o7_tasks/history/revision_14june.dart';
import 'package:o7_tasks/history/revision_14june3.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String returnedData = 'No data yet';

  void navigateAndReceiveData() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataPassingScreen(mydata: 'Hello from First Screen'),
      ),
    );

    // Update state with returned data
    if (result != null) {
      setState(() {
        returnedData = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UiComponents10June()),
                );
              },
              child: Text("Screen 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpandedRowScreen()),
                );
              },
              child: Text("Expanded Row"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedScreen()),
                );
              },
              child: Text("Text Widgets & Properties"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyButtons()),
                );
              },
              child: Text("Button Types"),
            ),
            SizedBox(height: 10),
            Text('Returned Data: $returnedData'),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: navigateAndReceiveData,
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DataPassingScreen(mydata: "Hello from first screen",)),
                // );

              child: Text("Data Passing"),
            ),
          ],
        ),
      ),
    );
  }
}