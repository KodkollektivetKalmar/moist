import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:client/createAccount.dart';
import 'package:client/forgotPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final tbxUsername = TextEditingController();
  final tbxPassword = TextEditingController();
  String msgUsername = "";
  String msgPassword = "";

  @override
  void dispose() {
    tbxUsername.dispose();
    tbxPassword.dispose();
    super.dispose();
  }

  bool validLogin(String username, String password) {
    return false;
  }

  bool usernameExists() {
    return false;
  }

  bool correctPassword() {
    return false;
  }

  void requestLogin() {
    if (validLogin(tbxUsername.text, tbxPassword.text)) {
      runApp(const MyApp());
    }
    if (!usernameExists()) {
      msgUsername = "Username doesn't exist";
    }
    if (!correctPassword()) {
      msgPassword = "Incorrect password";
    }
    setState(() {});
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

  Padding textField(String label, final controller, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          controller: controller,
          onFieldSubmitted: (value) {
            requestLogin();
          },
          obscureText: isPassword,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
        ),
      ),
    );
  }

  Padding link(final route, String txt) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            runApp(route);
          },
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                  fontSize: 12, decoration: TextDecoration.underline),
              text: txt,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Center(
          child: Column(
            children: [
              textField("Username", tbxUsername, false),
              errorMessage(msgUsername),
              textField("Password", tbxPassword, true),
              errorMessage(msgPassword),
              const Spacer(),
              link(const CreateAccount(), "Create account"),
              link(const ForgotPassword(), "Forgot password?"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    requestLogin();
                  },
                  child: const Text('Login'),
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
