import 'package:client/login.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final tbxEmail = TextEditingController();

  @override
  void dispose() {
    tbxEmail.dispose();
    super.dispose();
  }

  Padding button(Function action, String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 50),
            textStyle: const TextStyle(fontSize: 16)),
        onPressed: () {
          action();
        },
        child: Text(txt),
      ),
    );
  }

  void cancel() {
    setWindowMinSize(const Size(700, 550));
    setWindowMaxSize(const Size(700, 550));
    runApp(const Login());
  }

  void resetPassword() {
    setWindowMinSize(const Size(700, 550));
    setWindowMaxSize(const Size(700, 550));
    runApp(const Login());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Reset password"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      runApp(const Login());
                    },
                    controller: tbxEmail,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                    ),
                  ),
                ),
              ),
              const Text("Enter your email to reset password"),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(cancel, "Cancel"),
                  button(resetPassword, "Reset password"),
                ],
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
