import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'users/landingpage.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return LandingPage();
              } else {
                return LoginPage();
              }
            }),
      );
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class InitState extends State<Login> {
  var passwordController;

  var emailController;

  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: Color.fromARGB(255, 71, 211, 24),
                  gradient: LinearGradient(colors: [
                    (Color.fromARGB(255, 36, 211, 20)),
                    (Color.fromARGB(255, 39, 189, 20))
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset("assets/logo4.png"),
                      height: 220,
                      width: 220,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                    )
                  ]),
              alignment: Alignment.center,
              child: TextField(
                controller: emailController,
                cursorColor: Color.fromARGB(255, 28, 161, 1),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.perm_identity,
                      color: Color.fromARGB(255, 28, 161, 1),
                    ),
                    hintText: "Enter User",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                    )
                  ]),
              alignment: Alignment.center,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                cursorColor: Color.fromARGB(255, 28, 161, 1),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color.fromARGB(255, 28, 161, 1),
                    ),
                    hintText: "Enter Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 30),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text("Only Admin Can Access"),
                onTap: () => {},
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    (Color.fromARGB(255, 26, 148, 1)),
                    Color.fromARGB(255, 11, 182, 11)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future signIn() async {
  var emailController;
  var passwordController;
  var FirebaseAuth;
  await FirebaseAuth.instanceWithEmailAndPassword(
      email: emailController.text.trim(
    password: passwordController.text.trim(),
  ));
}
