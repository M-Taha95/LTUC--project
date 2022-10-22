import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mystoreapp/Screens/LogIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MystoreApp(),
  ));
}

class MystoreApp extends StatelessWidget {
  const MystoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LogIn();
  }
}
