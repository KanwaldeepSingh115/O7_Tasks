import 'package:flutter/material.dart';
import 'package:o7_tasks/history/revision_10june2.dart';

class MainApp2 extends StatelessWidget {
  const MainApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customizable AppBar'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        leading: Icon(Icons.menu),
        elevation: 8,
        actions: [
          IconButton(
            onPressed:
                () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Icon Pressed'))),
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ElevatedButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UiComponents10June()),
            ),
        child: Text('Switch Screen'),
      ),
    );
  }
}
