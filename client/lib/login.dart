import 'package:client/main.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => CreateAccountState();
}

class LoginState extends State<Login> {
  final tbxUsername = TextEditingController();
  final tbxPassword = TextEditingController();

  @override
  void dispose() {
    tbxUsername.dispose();
    tbxPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextField(
                    controller: tbxUsername,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
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
                    print(tbxPassword.text);
                    runApp(const MyApp());
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

class CreateAccountState extends State<CreateAccount> {
  final tbxUsername = TextEditingController();
  final tbxPassword = TextEditingController();
  final tbxRepeat = TextEditingController();

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
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextField(
                    controller: tbxUsername,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                        tbxPassword.text.length > 6) {
                      runApp(const MyApp());
                    } else if (tbxPassword.text.length <= 6) {
                      print("Password is shorter than 6 characters");
                    } else if (tbxPassword.text != tbxRepeat.text) {
                      print("Passwords don't match");
                    }
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
