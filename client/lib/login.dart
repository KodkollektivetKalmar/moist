import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
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
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    print("Glömt lösen noob");
                  },
                  child: const Text.rich(
                    TextSpan(
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      text: "Forgot password?",
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
                  onPressed: () {},
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
