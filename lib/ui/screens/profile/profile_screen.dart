import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ui/ui/screens/profile/widgets/clip_shape/clip_shape.dart';

import '../../../constants/constants.dart';
import '../../../utils/responsive.dart';
import '../../../utils/validator.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/model_class.dart';
import '../../widgets/responsive_ui.dart';
import '../../widgets/textformfield.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;

  final GlobalKey<FormState> _key = GlobalKey();
  Validator validator = Validator();
  var onChangeValue = "";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                child: Column(children: [
              ClipShape(),
              profileTextRow(),
              SizedBox(height: _height / 25),
              form(),
              SizedBox(height: _height / 60),
              CustomButton(
                large: _large,
                width: _width,
                medium: _medium,
                text: 'UPDATE',
                onPressed: () {
                  // if (_key.currentState!.validate()) {
                  //   _key.currentState!.save();
                  //   AuthClass().update(
                  //       firstNameController.text,
                  //       lastNameController.text,
                  //       cityController.text,
                  //       phoneController);
                  //   // use the email provided here
                  Navigator.of(context).pushNamed(HOME);
                },
              ),
              SizedBox(height: _height / 8),
            ]))));
  }

  Widget profileTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Profile",
          style: TextStyle(
            color: contrastColor,
            fontWeight: FontWeight.bold,
            fontSize: Responsive.isDesktop(context)
                ? 40.0
                : (Responsive.isTablet(context) ? 25.0 : 20.0),
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
            lastNameTextFormField(),
            SizedBox(height: _height / 60.0),
            cityTextField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      validator: (name) {
        setState(() {
          name = firstNameController.text;
        });
        return validator.validateName(name);
      },
      // onPressed: validator.validateName(ffirstNameController.text),
      textEditingController: firstNameController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      validator: (name) {
        setState(() {
          name = lastNameController.text;
        });
        return validator.validateName(name);
      },
      // onPressed: validator.validateName(ffirstNameController.text),
      textEditingController: lastNameController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
    );
  }

  Widget cityTextField() {
    return CustomTextField(
      validator: (city) {
        setState(() {
          city = cityController.text;
        });
        return validator.validateName(city);
      },
      textEditingController: cityController,
      keyboardType: TextInputType.text,
      icon: Icons.location_city,
      hint: "City",
    );
  }

  Widget phoneTextFormField() {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: _large ? 12 : (_medium ? 10 : 8),
      child: IntlPhoneField(
        onChanged: (value) {
          onChangeValue = value.completeNumber;
        },
        keyboardType: TextInputType.phone,
        controller: phoneController,
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          hintText: 'Mobile Number',
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        initialCountryCode: 'PK',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        disableLengthCheck: false,
        flagsButtonPadding: EdgeInsets.zero,
        dropdownIcon: Icon(
          Icons.arrow_drop_down,
          size: 25.0,
          color: Colors.orange[200],
        ),
      ),
    );
  }
}
