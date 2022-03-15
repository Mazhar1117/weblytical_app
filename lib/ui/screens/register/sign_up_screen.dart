import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../utils/validator.dart';
import '../../widgets/model_class.dart';
import '../authentication/widgets/my_button.dart';
import '../authentication/widgets/my_text_button.dart';
import '../authentication/widgets/my_text_field.dart';
import '../authentication/widgets/tag_line.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  var onChangeValue = "";

  Validator validator = Validator();

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
                child: Form(
          key: _key,
          child: Column(children: [
            const SizedBox(height: 60),
            const TagLine(
              title: "Let's Get Started!",
              tag: "Create an account to Q Allure to get all features",
            ),
            const SizedBox(height: 40),
            MyTextField(
              hint: "Name",
              validator: (name) {
                setState(() {
                  name = nameController.text;
                });
                return validator.validateName(name);
              },
              icon: Icons.account_circle,
              isPassword: false,
              controller: TextEditingController(),
            ),
            MyTextField(
              hint: "Email",
              validator: (email) {
                setState(() {
                  email = emailController.text;
                });
                return validator.validateEmail(email);
              },
              icon: Icons.mail_outline,
              isPassword: false,
              controller: TextEditingController(),
            ),
            MyTextField(
              hint: "Phone",
              validator: (phone) {
                setState(() {
                  phone = phoneController.text;
                });
                return validator.validateMobile(phone);
              },
              icon: Icons.phone_android,
              isPassword: false,
              controller: TextEditingController(),
            ),
            MyTextField(
              hint: "Password",
              validator: (password) {
                setState(() {
                  password = passwordController.text;
                });
                return validator.validatePasswordLength(password);
              },
              icon: Icons.lock_outline_rounded,
              isPassword: true,
              controller: TextEditingController(),
            ),
            MyTextField(
              hint: "Confirm Password",
              validator: (String? confirmPassword) {
                if (confirmPassword!.isEmpty) {
                  return "Please re-enter password";
                } else if (confirmPassword != passwordController.text) {
                  return "Password does not match";
                }
                return ' ';
              },
              icon: Icons.lock_outline_rounded,
              isPassword: true,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 10),
            MyButton(
                color: Colors.blue,
                title: "CREATE",
                onTap: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    AuthClass().register(
                      nameController.text,
                      phoneController,
                      emailController.text,
                      onChangeValue,
                      passwordController.text,
                    );
                    // use the email provided here
                    Navigator.of(context).pushNamed(HOME);
                  }
                },
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
          ]),
        ))));
  }
}
