import 'package:flutter/material.dart';
import 'package:shared_preference1/pages/account_page.dart';

import 'models/pref_servis.dart';
import 'models/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordHide = true;

  void _doLogin(){
    String email = emailController.text.toString().trim();
    String password = emailController.text.toString().trim();
    User user = User.from(email: email, password: password,);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user) => {
      print(user?.email),
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 270,
              padding: const EdgeInsets.only(top: 100),
              child: const Image(
                image: AssetImage("assets/image.png"),
              ),
            ),
            const Text(
              "Welcome back!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Log in to your existent account od Q Allure",
              style: TextStyle(fontSize: 13.0, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  prefixIcon: Icon(Icons.person_outline_outlined),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: passwordController,

                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  prefixIcon: Icon(Icons.lock_outlined),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Forget password?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.indigoAccent,
              ),
              child: TextButton(
                onPressed: _doLogin,
                child: const Text(
                  "LOG IN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Text(
              "Or connect using",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  height: 38,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.indigo,
                  ),
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage("assets/facebook.png"),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Facebook",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 15.0),

                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  height: 38,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red,
                  ),
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage("assets/google7.png"),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Google",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return const AccountPage();
                    }));
                  },
                  child: const Text(
                    "Sing Up",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
