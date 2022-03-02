import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/ui/widgets/responsive_ui.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  // final String? Function(String?)? validator;

  // final  onPressed;
  final bool obscureText;
  final IconData icon;
  late double _width;
  late double _pixelRatio;
  late bool large;
  late bool medium;

  CustomTextField({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    this.obscureText = false,
    // this.validator,
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        // validator: onPressed,
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[200],
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          prefixIcon: Icon(icon, color: Colors.orange[200], size: 20),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  // final  onPressed;
  final bool obscureText;
  final IconData prefixIcon;
  final Widget suffix;
  late double _width;
  late double _pixelRatio;
  late bool large;
  late bool medium;

  PasswordField({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.prefixIcon,
    required this.obscureText,
    required this.suffix,
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        obscureText: obscureText,
        // validator: onPressed,
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[200],
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          prefixIcon: Icon(prefixIcon, color: Colors.orange[200], size: 20),
          suffixIcon: suffix,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class PhoneField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  PhoneField({
    Key? key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    // required this.onPressed,
  }) : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  var onchangeval = "";
  // final  onPressed;
  late double _width;

  late double _pixelRatio;

  late bool large;

  late bool medium;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: IntlPhoneField(
        // validator: validator,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        initialCountryCode: 'PK',
        // autovalidateMode: AutovalidateMode.always,
        disableLengthCheck: true,
        flagsButtonPadding: EdgeInsets.zero,
        dropdownIcon: Icon(
          Icons.arrow_drop_down,
          size: 25.0,
          color: Colors.orange[200],
        ),
//         onChanged: (value) {
//           setState(() {
//             onchangeval = value.completeNumber;
//           });
// Scaffold.of(context).showSnackBar(SnackBar(content: Text("Not Eklendi"), duration: Duration(seconds: 2));
//         },
      ),
    );
  }
}