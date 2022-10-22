import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResrPassword extends StatefulWidget {
  const ResrPassword({super.key});

  @override
  State<ResrPassword> createState() => _ResrPasswordState();
}

class _ResrPasswordState extends State<ResrPassword> {
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: passwordController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Password reset link sent! check your email !"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      // print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe46b10),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
          Text(
            "Enter your Email and we will send you a Password reset link",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              labelText: "Email",
            ),
          ),
          MaterialButton(
            onPressed: () {
              passwordReset();
            },
            child: Text(
              "Reset Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            color: Color(0xffe46b10),
          )
        ],
      ),
    );
  }
}
