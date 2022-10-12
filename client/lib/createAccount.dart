import 'package:client/login.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => CreateAccountState();
}

class CreateAccountState extends State<CreateAccount> {
  final tbxUsername = TextEditingController();
  final tbxPassword = TextEditingController();
  final tbxRepeat = TextEditingController();
  final tbxEmail = TextEditingController();
  String msgUsername = "";
  String msgEmail = "";
  String msgPassword = "";

  @override
  void dispose() {
    tbxUsername.dispose();
    tbxPassword.dispose();
    tbxRepeat.dispose();
    super.dispose();
  }

  bool usernameAvailable() {
    return true;
  }

  void requestAccountCreation() {
    if (tbxPassword.text == tbxRepeat.text &&
        tbxPassword.text.length > 6 &&
        usernameAvailable()) {
      runApp(const Login());
    } else if (tbxPassword.text.length <= 6) {
      msgPassword = "Password must be longer than 6 characters";
    } else if (tbxPassword.text != tbxRepeat.text) {
      msgPassword = "Passwords don't match";
    }
    setState(() {});
  }

  Padding textField(String label, final controller, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          onFieldSubmitted: (value) {
            requestAccountCreation();
          },
          controller: controller,
          obscureText: isPassword,
          autocorrect: false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
        ),
      ),
    );
  }

  Text errorMessage(String msg) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          fontSize: 12,
          color: Colors.red,
        ),
        text: msg,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Create account"),
        ),
        body: Center(
          child: Column(
            children: [
              textField("Username", tbxUsername, false),
              errorMessage(msgUsername),
              textField("E-mail", tbxEmail, false),
              errorMessage(msgEmail),
              textField("Password", tbxPassword, true),
              textField("Repeat password", tbxRepeat, true),
              errorMessage(msgPassword),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      textStyle: const TextStyle(fontSize: 16)),
                  onPressed: () {
                    requestAccountCreation();
                  },
                  child: const Text('Create Account'),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
