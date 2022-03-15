import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../constants/logos.dart';
import '../../../utils/validator.dart';
import '../../widgets/model_class.dart';
import 'widgets/my_button.dart';
import 'widgets/my_text_button.dart';
import 'widgets/my_text_field.dart';
import 'widgets/tag_line.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                validator: (email) {
                  if (email!.isEmpty) {
                    return "Email field can't be empty";
                  }
                  return null;
                  // setState(() {
                  //   email = emailController.text;
                  // });
                  // return validator.validateEmail(email);
                },
                icon: Icons.account_circle,
                isPassword: false,
                controller: emailController,
              ),
              MyTextField(
                hint: "Password",
                validator: (pass) {
                  if (pass!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                icon: Icons.lock_outline_rounded,
                isPassword: true,
                controller: passwordController,
              ),
              MyTextButton(title: "Forgot Password?", onTap: () {}),
              const SizedBox(height: 10),
              MyButton(
                  color: Colors.blue,
                  title: "LOG IN",
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      AuthClass().login(emailController.text,
                          passwordController.text, context);
                      _key.currentState!.save();
                      // use the email provided here
                      Navigator.of(context).pushReplacementNamed(HOME);
                    }
                  },
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
      ),
    );
  }
}
