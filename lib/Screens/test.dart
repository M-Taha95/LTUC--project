import 'package:flutter/material.dart';
import 'package:mystoreapp/Screens/Sign%20Up.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () {
                Navigator.pop(context, MaterialPageRoute(
                  builder: (context) {
                    return SignUpPage();
                  },
                ));
              },
              child: Text(
                "go sigh up",
                style: TextStyle(fontSize: 40),
              ))),
    );
  }
}
