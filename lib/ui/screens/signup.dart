import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/ui/screens/dashboard.dart';
import 'package:ui/ui/widgets/custom_button.dart';
import 'package:ui/ui/widgets/custom_shape.dart';
import 'package:ui/ui/widgets/model_class.dart';
import 'package:ui/ui/widgets/responsive_ui.dart';
import 'package:ui/ui/widgets/textformfield.dart';
import 'package:http/http.dart' as http;
// import 'package:ui/utils/validator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  // Validator validator = Validator();
  bool _passwordInVisible = true;
  // final String baseURL = "https://127.0.0.1:8000/api/auth/signin";

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
        margin: const EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              clipShape(),
              form(),
              acceptTermsTextRow(),
              SizedBox(height: _height / 60),
              CustomButton(
                large: _large,
                width: _width,
                medium: _medium,
                text: 'SIGN UP',
                onPressed: () {
                  AuthClass().register(
                    fNameController.text,
                    emailController.text,
                    contactController.text,
                    passwordController.text,
                    cityController.text,
                  );
                  Navigator.of(context).pushNamed(HOME);
                },
              ),
              SizedBox(height: _height / 7),
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
              decoration: const BoxDecoration(gradient: firstGradient),
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
        Center(
          child: Container(
            height: _height / 3.5,
            width: _width / 3.5,
            margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20),
            ),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    spreadRadius: 0.0,
                    color: Colors.black26,
                    offset: Offset(1.0, 10.0),
                    blurRadius: 20.0),
              ],
              color: textColor,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.add_a_photo,
                size: _large ? 40 : (_medium ? 33 : 25),
                color: Colors.blue.shade200,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
        left: _width / 12.0,
        right: _width / 12.0,
        top: _height / 80.0,
      ),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            cityTextField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      // onPressed: validator.validateName(fNameController.text),
      textEditingController: fNameController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Name",
    );
  }

  Widget cityTextField() {
    return CustomTextField(
      // onPressed: validator.validateName(lNameController.text),
      textEditingController: cityController,
      keyboardType: TextInputType.text,
      icon: Icons.location_city,
      hint: "City",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      // onPressed: validator.validateEmail(emailController.text),
      textEditingController: emailController,
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget phoneTextFormField() {
    return PhoneField(
        // onPressed: validator.validateMobile(contactController.text),
        textEditingController: contactController,
        keyboardType: TextInputType.number,
        hint: "Phone Number",
        );
  }

  Widget passwordTextFormField() {
    return PasswordField(
      // onPressed: validator.validatePasswordLength(passwordController.text),
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

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.black87,
            ),
            child: Checkbox(
              checkColor: backgroundColor,
              activeColor: Colors.blue[100],
              value: checkBoxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkBoxValue = value!;
                });
              },
            ),
          ),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: _large ? 12 : (_medium ? 11 : 10),
              color: contrastColor,
            ),
          ),
        ],
      ),
    );
  }
}
