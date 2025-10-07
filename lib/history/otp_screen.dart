import 'package:flutter/material.dart';

class OTP extends StatefulWidget {
  final int myotp;
  const OTP({super.key, required this.myotp});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController otpController = TextEditingController();

  void verifyOtp() {
    final otpInput = int.parse(otpController.text.trim());
    if (otpInput == widget.myotp) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('OTP Verification Successful!')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('OTP Verification Failed!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Screen'), backgroundColor: Colors.teal),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Otp: ${widget.myotp}'),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter OTP',
              ),
              maxLength: 4,
              controller: otpController,
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                verifyOtp();
              },
              child: Text('Match OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
