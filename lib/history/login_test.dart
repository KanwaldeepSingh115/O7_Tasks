import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String name;
  final String uni_roll;
  final String email;
  final String phone;
  final String password;

  const LoginScreen({
    super.key,
    required this.name,
    required this.uni_roll,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome, $name", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Uni RollNo: $uni_roll"),
            Text("Email: $email"),
            Text("Phone: $phone"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login successful")),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
