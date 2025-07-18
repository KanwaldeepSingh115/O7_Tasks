import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Hello Flutter!',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.5,
              wordSpacing: 2,
              height: 1.2,
              backgroundColor: Colors.yellow,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.dashed,
              fontFamily: 'Roboto',
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textScaleFactor: 1.2,
            semanticsLabel: 'Hello text',
          ),
          TextField(
            controller: TextEditingController(),
            focusNode: FocusNode(),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            maxLength: 50,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Enter name',
              labelText: 'Name',
              helperText: 'Required',
              counterText: '',
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(Icons.clear),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.start,
            textCapitalization: TextCapitalization.words,
            autofocus: false,
            enabled: true,
            readOnly: false,
            onChanged: (value) => print(value),
            onSubmitted: (value) => print('Submitted: $value'),
            onEditingComplete: () => print('Editing complete'),
            cursorColor: Colors.red,
            cursorWidth: 2,
            cursorHeight: 20,
            enableSuggestions: true,
            enableInteractiveSelection: true,
            toolbarOptions: ToolbarOptions(copy: true, paste: true),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: 200,
            height: 100,

            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            transform: Matrix4.rotationZ(0.1),
            child: Text('Motion!'),
          ),
          SizedBox(height: 30),
          RotatedBox(quarterTurns: 4, child: Text('Rotated')),

          SizedBox(height: 30),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Rotating",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
