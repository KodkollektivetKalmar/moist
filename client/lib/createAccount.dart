import 'package:flutter/material.dart';
import 'package:client/main.dart';

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
  String message = "";

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
              SizedBox(
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextFormField(
                    controller: tbxUsername,
                    autocorrect: false,
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
                    controller: tbxEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextFormField(
                    controller: tbxPassword,
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
              SizedBox(
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: tbxRepeat,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Repeat Password',
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
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      textStyle: const TextStyle(fontSize: 16)),
                  onPressed: () {
                    if (tbxPassword.text == tbxRepeat.text &&
                        tbxPassword.text.length > 6 &&
                        usernameAvailable()) {
                      runApp(const MyApp());
                    } else if (tbxPassword.text.length <= 6) {
                      message = "Password must be longer than 6 characters";
                    } else if (tbxPassword.text != tbxRepeat.text) {
                      message = "Passwords don't match";
                    }
                    setState(() {});
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
