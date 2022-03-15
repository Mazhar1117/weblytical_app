import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/constants/logos.dart';
import 'widgets/my_button.dart';
import 'widgets/my_text_button.dart';
import 'widgets/my_text_field.dart';
import 'widgets/tag_line.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/images/login.png"),
            ),
            const SizedBox(height: 20),
            const TagLine(
                title: "Welcome back!",
                tag: "Log in to your acccount of Q Allure"),
            const SizedBox(height: 40),
            MyTextField(
              hint: "Email",
              validator: (data) {},
              icon: Icons.account_circle,
              isPassword: false,
              controller: TextEditingController(),
            ),
            MyTextField(
              hint: "Password",
              validator: (data) {},
              icon: Icons.lock_outline_rounded,
              isPassword: true,
              controller: TextEditingController(),
            ),
            MyTextButton(title: "Forgot Password?", onTap: () {}),
            const SizedBox(height: 10),
            MyButton(
                color: Colors.blue,
                title: "LOG IN",
                onTap: () {},
                isSocial: false,
                logo: null),
            const SizedBox(height: 40),
            const Text(
              "Or connect using",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              MyButton(
                  color: Colors.blue.shade900,
                  title: "Facebook",
                  onTap: () {},
                  isSocial: true,
                  logo: fb),
              const SizedBox(width: 10),
              MyButton(
                  color: Colors.red,
                  title: "Google  ",
                  onTap: () {},
                  isSocial: true,
                  logo: google),
            ]),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 15),
                ),
                MyTextButton(
                  title: "Sign Up",
                  onTap: () {
                    Navigator.of(context).pushNamed(SIGN_UP);
                  },
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
