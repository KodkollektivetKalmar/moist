import 'package:client/login.dart';
import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

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

  bool validUsername() {
    if (tbxUsername.text.length < 4) {
      msgUsername = "Username must be longer than 4 characters";
      return false;
    } else {
      msgUsername = "";
    }

    return true;
  }

  bool validEmail() {
    if (tbxEmail.text.length <= 4) {
      msgEmail = "E-mail must be longer than 4 characters";
      return false;
    } else {
      msgEmail = "";
    }

    return true;
  }

  bool validPassword() {
    if (tbxPassword.text.length <= 6) {
      msgPassword = "Password must be longer than 6 characters";
      return false;
    } else {
      msgPassword = "";
    }

    if (tbxPassword.text != tbxRepeat.text) {
      msgPassword = "Passwords don't match";
      return false;
    } else {
      msgPassword = "";
    }

    return true;
  }

  void requestAccountCreation() {
    if (validUsername() && validEmail() && validPassword()) {
      setWindowMinSize(const Size(1600, 950));
      setWindowMaxSize(Size.infinite);

      runApp(const MyApp());
    }

    setState(() {});
  }

  Padding textField(String label, final controller, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
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
              const SizedBox(
                height: 12,
              ),
              textField("Repeat password", tbxRepeat, true),
              errorMessage(msgPassword),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(cancel, "Cancel"),
                  button(requestAccountCreation, "Create Account"),
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
