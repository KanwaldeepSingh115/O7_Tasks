import 'package:flutter/material.dart';
import 'package:o7_tasks/history/assignment_26june.dart';
import 'package:o7_tasks/revision_27june.dart';
import 'package:o7_tasks/revision_28june.dart';
import 'package:o7_tasks/testingcode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: const DrawerPro(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String returnedData = 'No Data yet';

  void navigateAndReceiveData() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Testing(mydata: 'Hello From First Screen'),
      ),
    );

    if (result != null) {
      setState(() {
        returnedData = result;
      });
    }
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: 10),
            Text('Returned Data: $returnedData'),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: navigateAndReceiveData,
              child: Text('Data Passing'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
