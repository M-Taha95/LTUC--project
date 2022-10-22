import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mystoreapp/Screens/Admin.dart';
import 'package:mystoreapp/Screens/Home.dart';
import 'package:mystoreapp/Screens/Rest-Password.dart';
import 'package:mystoreapp/Screens/Sign%20Up.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              "Sign In As Admin",
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
                  border: OutlineInputBorder(), labelText: "Admin Email"),
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
                    UserCredential admin = await authenticationobject
                        .createUserWithEmailAndPassword(
                            email: nameController.text,
                            password: passwordController.text);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("sorry, this email is already used !")));
                  }
                },
                child: Text("Log In as Admin")),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Does not have an account ?"),
          //     TextButton(
          //         onPressed: () async {
          //           try {
          //             var authenticationobject = FirebaseAuth.instance;
          //             UserCredential user =
          //                 await authenticationobject.signInWithEmailAndPassword(
          //                     email: nameController.text,
          //                     password: passwordController.text);
          //           } catch (e) {
          //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //                 content:
          //                     Text("sorry, this email is already used !")));
          //           }
          //           Navigator.push(context, MaterialPageRoute(
          //             builder: (context) {
          //               return SignUpPage();
          //             },
          //           ));
          //         },
          //         child: Text(
          //           "Sign Up",
          //           style: TextStyle(fontSize: 20),
          //         )),
          //   ],
          // ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Admin();
                  },
                ));
              },
              child: Text("As User"))
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
