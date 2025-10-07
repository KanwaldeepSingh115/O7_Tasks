import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Success Page')),
      body: Center(
        child: Text(
          'Form Submitted Successfully',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
