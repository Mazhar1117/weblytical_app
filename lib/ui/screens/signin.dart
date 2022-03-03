// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
//import 'package:http/http.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/ui/widgets/custom_button.dart';
import 'package:ui/ui/widgets/custom_shape.dart';
import 'package:ui/ui/widgets/model_class.dart';
import 'package:ui/ui/widgets/responsive_ui.dart';
import 'package:ui/ui/widgets/textformfield.dart';
import 'package:ui/utils/responsive.dart';
import 'package:ui/utils/validator.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  Validator validator = Validator();
  bool _passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      color: backgroundColor,
      child: Container(
        height: _height,
        width: _width,
        padding: const EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              clipShape(),
              welcomeTextRow(),
              signInTextRow(),
              form(),
              forgetPassTextRow(),
              SizedBox(height: _height / 12),
              CustomButton(
                large: _large,
                width: _width,
                medium: _medium,
                text: 'SIGN IN',
                onPressed: () {
                  // Scaffold.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Login Successful'),
                  //   ),
                  // );
                  AuthClass().login(
                      emailController.text, passwordController.text, context);
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    // use the email provided here
                    Navigator.of(context).pushNamed(HOME);
                  }
                },
              ),
              signUpTextRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: const BoxDecoration(
                gradient: firstGradient,
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: const BoxDecoration(gradient: secondGradient),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20)),
          child: Image.asset(
            'assets/images/login.png',
            height: _height / 3.5,
            width: _width / 3.5,
          ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome To AimsysCloud",
            style: TextStyle(
              color: contrastColor,
              fontWeight: FontWeight.bold,
              fontSize: Responsive.isDesktop(context)
                  ? 40.0
                  : (Responsive.isTablet(context) ? 25.0 : 20.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0, top: _height / 60.0),
      child: Row(
        children: <Widget>[
          Text(
            "Sign in to your account",
            style: TextStyle(
              color: contrastColor,
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
        left: _width / 12.0,
        right: _width / 12.0,
        top: _height / 15.0,
      ),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      validator: (email) {
        setState(() {
          email = emailController.text;
        });
        return validator.validateEmail(email);
      },
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget passwordTextFormField() {
    return PasswordField(
      validator: (pass) {
        setState(() {
          pass = passwordController.text;
        });
        return validator.validatePasswordLength(pass);
      },
      keyboardType: TextInputType.number,
      textEditingController: passwordController,
      prefixIcon: Icons.lock,
      obscureText: _passwordInVisible,
      suffix: IconButton(
        icon: Icon(
          _passwordInVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: Colors.orange[200],
        ),
        onPressed: () {
          setState(() {
            _passwordInVisible = !_passwordInVisible;
          });
        },
      ),
      hint: "Password",
    );
  }

  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(
                color: contrastColor,
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Recover",
              style: TextStyle(fontWeight: FontWeight.w600, color: buttonColor),
            ),
          )
        ],
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
                color: contrastColor,
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SIGN_UP);
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: buttonColor,
                fontSize: _large ? 19 : (_medium ? 17 : 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
