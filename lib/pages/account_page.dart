import 'package:flutter/material.dart';
import 'package:shared_preference1/models/user2_model.dart';
import '../models/pref2_servis.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final accountsController = TextEditingController();
  final emailsController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool passwordHide = true;
  bool confirmHide = true;

  void _doLogins() {
    String emails = emailsController.text.toString().trim();
    String accounts = accountsController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String passwords = passwordController.text.toString().trim();
    String confirm = confirmController.text.toString().trim();

    if (emails.isNotEmpty &&
        accounts.isNotEmpty &&
        phone.isNotEmpty &&
        passwords.isNotEmpty &&
        confirm.isNotEmpty) {
      if (passwords == confirm) {
        Exploiter exploiter = Exploiter.from(
            accounts: accounts,
            email: emails,
            password: passwords,
            phone: phone,
            confirm: confirm);

        Prefer.storeExploiter(exploiter);

        Prefer.loadExploiter().then((exploiter) => {
              print(exploiter?.toJson()),
            });
      } else {
        print("password is not equals");
      }
    } else {
      print("Fill all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Let's Get Started!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Created an account is Q Allure is get at Started",
              style: TextStyle(fontSize: 13.0, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 40),
            getAccount(
              icon: Icons.person_outline_outlined,
              text: "Account",
              controller: accountsController,
            ),
            const SizedBox(height: 20),
            getAccount(
              icon: Icons.email_outlined,
              text: "Email",
              controller: emailsController,
            ),
            const SizedBox(height: 20),
            getAccount(
              icon: Icons.phone_android_outlined,
              text: "Phone",
              controller: phoneController,
            ),
            const SizedBox(height: 20),
            getAccount(
                icon: Icons.lock_open_outlined,
                text: "Password",
                controller: passwordController,
                isPassword: true,
                showPassword: passwordHide,
                obscureState: (value) {
                  passwordHide = value;
                  setState(() {});
                }),
            const SizedBox(height: 20),
            getAccount(
                icon: Icons.lock_open_outlined,
                text: "Confirm Password",
                controller: confirmController,
                isPassword: true,
                showPassword: confirmHide,
                obscureState: (value) {
                  confirmHide = value;
                  setState(() {});
                }),
            const SizedBox(height: 35),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.indigo,
              ),
              child: TextButton(
                onPressed: _doLogins,
                child: const Text(
                  "CREATE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Login here",
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

  Widget getAccount(
      {required IconData icon,
      required String text,
      required TextEditingController controller,
      bool isPassword = false,
      bool showPassword = false,
      Function(bool)? obscureState}) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.blue),
        obscureText: showPassword,
        decoration: InputDecoration(
            hintText: text,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            prefixIcon: Icon(icon),
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: () {
                      if (obscureState != null) obscureState(!showPassword);
                    },
                    child: Icon(showPassword
                        ? Icons.remove_red_eye
                        : Icons.visibility_off))
                : null),
      ),
    );
  }
}
