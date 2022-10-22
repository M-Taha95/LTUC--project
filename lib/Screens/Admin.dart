import 'package:flutter/material.dart';

import 'package:mystoreapp/Screens/Home.dart';
import 'package:mystoreapp/Screens/Rest-Password.dart';
import 'package:mystoreapp/Screens/Sign%20Up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ionicons/ionicons.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          Container(
            alignment: Alignment.center,
            child: _title(),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "Sign In as User",
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xffe4b10),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://1.bp.blogspot.com/-BubVtFoFpw4/Xq4UgkmSK6I/AAAAAAAB3sg/UbLAG2eV3c4w-wByrPvpJPrGkkD6gKSTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/%25D9%2583%25D9%2584%25D9%258A%25D8%25A9%2B%25D9%2584%25D9%2588%25D9%2585%25D9%258A%25D9%2586%25D9%2588%25D8%25B3.png"))),
            height: 100,
            width: 100,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "User Name"),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ResrPassword();
                  },
                ));
              },
              child: Text(
                "Forget Password",
                style: TextStyle(
                  color: Color(0xffe46b10),
                  fontStyle: FontStyle.italic,
                ),
              )),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffe46b10)),
                onPressed: () async {
                  // print(nameController.text);
                  // print(passwordController.text);
                  try {
                    var authenticationobject = FirebaseAuth.instance;
                    UserCredential user = await authenticationobject
                        .createUserWithEmailAndPassword(
                            email: nameController.text,
                            password: passwordController.text);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignUpPage();
                      },
                    ));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("sorry, this email is already used !")));
                  }
                },
                child: Text("Log In as User")),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Does not have an account ?"),
              TextButton(
                  onPressed: () async {
                    try {
                      var authenticationobject = FirebaseAuth.instance;
                      UserCredential user =
                          await authenticationobject.signInWithEmailAndPassword(
                              email: nameController.text,
                              password: passwordController.text);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("sorry, this email is already used !")));
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}

Widget _title() {
  return RichText(
    softWrap: false,
    text: TextSpan(
        onEnter: ((event) {
          print("123");
        }),
        text: 'Lt',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10)),
        children: [
          TextSpan(
            text: 'uc Stu',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'dents',
            style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
          ),
        ]),
  );
}
