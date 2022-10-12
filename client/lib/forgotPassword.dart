import 'package:client/login.dart';
import 'package:flutter/material.dart';
import 'package:client/main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final tbxUsername = TextEditingController();
  final tbxPassword = TextEditingController();
  final tbxRepeat = TextEditingController();
  final tbxEmail = TextEditingController();
  String message = "";

  @override
  void dispose() {
    tbxUsername.dispose();
    tbxPassword.dispose();
    tbxRepeat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Request new password"),
        ),
        body: Center(
          child: Column(
            children: [
              TextFormField(),
              const Text("Enter your email and we will send a new one"),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
