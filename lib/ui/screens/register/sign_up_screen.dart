import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/ui/screens/authentication/widgets/my_button.dart';
import '../authentication/widgets/my_text_button.dart';
import '../authentication/widgets/my_text_field.dart';
import '../authentication/widgets/tag_line.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const BackButton(color: Colors.black)),
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
          const TagLine(
            title: "Let's Get Started!",
            tag: "Create an account to Q Allure to get all features",
          ),
          const SizedBox(height: 40),
          MyTextField(
            hint: "Name",
            validator: (data) {},
            icon: Icons.account_circle,
            isPassword: false,
            controller: TextEditingController(),
          ),
          MyTextField(
            hint: "Email",
            validator: (data) {},
            icon: Icons.mail_outline,
            isPassword: false,
            controller: TextEditingController(),
          ),
          MyTextField(
            hint: "Phone",
            validator: (data) {},
            icon: Icons.phone_android,
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
          MyTextField(
            hint: "Confirm Password",
            validator: (data) {},
            icon: Icons.lock_outline_rounded,
            isPassword: true,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 10),
          MyButton(
              color: Colors.blue,
              title: "CREATE",
              onTap: () {},
              isSocial: false,
              logo: null),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(fontSize: 15),
              ),
              MyTextButton(
                title: "Login here",
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(SIGN_IN);
                },
              )
            ],
          )
        ]))));
  }
}
