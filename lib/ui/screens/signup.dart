import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/ui/widgets/custom_button.dart';
import 'package:ui/ui/widgets/custom_shape.dart';
import 'package:ui/ui/widgets/model_class.dart';
import 'package:ui/ui/widgets/responsive_ui.dart';
import 'package:ui/ui/widgets/textformfield.dart';
import 'package:ui/utils/validator.dart';

import '../../utils/responsive.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  var onChangeValue = "";
  Validator validator = Validator();
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
              welcomeTextRow(),
              signUpTextRow(),
              SizedBox(height: _height / 25),
              form(),
              acceptTermsTextRow(),
              SizedBox(height: _height / 60),
              CustomButton(
                large: _large,
                width: _width,
                medium: _medium,
                text: 'SIGN UP',
                onPressed: () {
                  if (_key.currentState!.validate() || checkBoxValue != false) {
                    _key.currentState!.save();
                    AuthClass().register(
                      // nameController.text,
                      emailController.text,
                      // onChangeValue,
                      passwordController.text,
                      confirmPasswordController.text,
                      // cityController.text,
                    );
                    // use the email provided here
                    // Navigator.of(context).pushNamed(HOME);
                    Navigator.of(context).pushNamed(PROFILE);
                  }
                },
              ),
              signInTextRow(),
              SizedBox(height: _height / 8),
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

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0, top: _height / 60.0),
      child: Row(
        children: <Widget>[
          Text(
            "Register your account",
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
        top: _height / 80.0,
      ),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
            SizedBox(height: _height / 60.0),
            confirmPasswordTextFormField()
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
      textEditingController: emailController,
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget confirmPasswordTextFormField() {
    return PasswordField(
      validator: (String? confirmPassword) {
        if (confirmPassword!.isEmpty) {
          return "Please re-enter password";
        } else if (confirmPassword != passwordController.text) {
          return "Password does not match";
        }
        return ' ';
      },
      keyboardType: TextInputType.number,
      textEditingController: confirmPasswordController,
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
      hint: "Conform Password",
    );
  }

  Widget passwordTextFormField() {
    return PasswordField(
      validator: (password) {
        setState(() {
          password = passwordController.text;
        });
        return validator.validatePasswordLength(password);
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

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
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
              Navigator.of(context).pushNamed(SIGN_IN);
            },
            child: Text(
              "SignIn",
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
