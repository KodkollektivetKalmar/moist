import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:client/createAccount.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final tbxUsername = TextEditingController();
  final tbxPassword = TextEditingController();
  String message = "";

  @override
  void dispose() {
    tbxUsername.dispose();
    tbxPassword.dispose();
    super.dispose();
  }

  bool isLoginValid(String username, String password) {
    return true;
  }

  void requestLogin() {
    if (isLoginValid(tbxUsername.text, tbxPassword.text)) {
      runApp(const MyApp());
    } else {
      message = "Invalid login details";
      setState(() {});
    }
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
              SizedBox(
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextFormField(
                    controller: tbxUsername,
                    onFieldSubmitted: (value) {
                      requestLogin();
                    },
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: tbxPassword,
                    onFieldSubmitted: (value) {
                      requestLogin();
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                  text: message,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      runApp(const CreateAccount());
                    },
                    child: const Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 12,
                            // color: Colors.blue,
                            decoration: TextDecoration.underline),
                        text: "Create account",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      print("Glömt lösen noob");
                    },
                    child: const Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 12,
                            // color: Colors.blue,
                            decoration: TextDecoration.underline),
                        text: "Forgot password?",
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
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
