import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/pages/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.auth});

  final FirebaseAuth auth;

  final TextEditingController emailC = TextEditingController(text: "admin123@gmail.com");
  final TextEditingController passC = TextEditingController(text: "admin123");

  void login() async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: emailC.text, password: passC.text);

    print(userCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
              color: Color.fromARGB(255, 71, 211, 24),
              gradient: LinearGradient(
                colors: [
                  (Color.fromARGB(255, 36, 211, 20)),
                  (Color.fromARGB(255, 39, 189, 20)),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                )
              ],
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: emailC,
              cursorColor: const Color.fromARGB(255, 28, 161, 1),
              decoration: const InputDecoration(
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
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                )
              ],
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: passC,
              obscureText: true,
              cursorColor: const Color.fromARGB(255, 28, 161, 1),
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.vpn_key,
                  color: Color.fromARGB(255, 28, 161, 1),
                ),
                hintText: "Enter Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 30),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: const Text("Only Admin Can Access"),
              onTap: () => {},
            ),
          ),
          GestureDetector(
            onTap: () async {
              login();
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    (Color.fromARGB(255, 26, 148, 1)),
                    Color.fromARGB(255, 11, 182, 11),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE)),
                ],
              ),
              child: const Text(
                "LOGIN",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
