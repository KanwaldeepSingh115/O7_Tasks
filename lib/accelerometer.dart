import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';

class Accelerometer extends StatefulWidget {
  const Accelerometer({super.key});

  @override
  State<Accelerometer> createState() => _AccelerometerState();
}

class _AccelerometerState extends State<Accelerometer> {
  double x = 0, y = 0, z = 0;
  final double threshold = 2.5490;
  DateTime? lastShakeTime;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });

      _checkShake();
    });
  }

  void _checkShake() {
    double gForce = sqrt(x * x + y * y + z * z) / 9.8;

    if (gForce > threshold) {
      final now = DateTime.now();

      if (lastShakeTime == null ||
          now.difference(lastShakeTime!).inMilliseconds > 700) {
        lastShakeTime = now;
        Fluttertoast.showToast(msg: 'Device Shaken!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'X: ${x.toStringAsFixed(2)}\n'
          'Y: ${y.toStringAsFixed(2)}\n'
          'Z: ${z.toStringAsFixed(2)}\n',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

