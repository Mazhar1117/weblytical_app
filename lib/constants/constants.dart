import 'package:flutter/material.dart';

const firstGradient = LinearGradient(
  colors: [
    // Color(0xff98A0AB),
    // Color(0xff484F5F),
    // Color(0xff303E59),
    Color(0xffa2d2f8),
    Color(0xffbee0fb),
    Color(0xffeef7fe),
  ],
);
const secondGradient = LinearGradient(
  colors: [
    // Color(0xff98A0AB),
    // Color(0xffC1C9D6),
    // Color(0xff354866),
    Color(0xffa3d1f6),
    Color(0xffc6e2f8),
    Color(0xfff5f8fa),
  ],
);
const buttonColor = Color(0xff90caf8);
const appColor = Color(0xff0067ff);
const textColor = Colors.white;
const contrastColor = Colors.black;
const backgroundColor = Color(0xfffafafa);
const buttonDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(20.0),
  ),
  color: buttonColor,
);
const defaultPadding = 16.0;

const String SIGN_IN = 'signin';
const String SIGN_UP = 'signup';
const String DASHBOARD = 'dashboard';
const String HOME = 'home';
