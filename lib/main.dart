import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/home.dart';
import 'pages/launcher.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;

  runApp(MyApp(auth));
}

class MyApp extends StatelessWidget {
  const MyApp(this.auth, {super.key});

  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 5)),
      builder: (context, snapLauncher) {
        if (snapLauncher.connectionState == ConnectionState.waiting) return const LauncherPage();

        return StreamBuilder<User?>(
          stream: auth.authStateChanges(),
          builder: (context, snapLogin) {
            if (snapLogin.connectionState == ConnectionState.waiting) return const LauncherPage();

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Warehouse",
              home: snapLogin.data != null ? HomePage(user: snapLogin.data!, auth: auth) : LoginPage(auth: auth),
            );
          },
        );
      },
    );
  }
}
