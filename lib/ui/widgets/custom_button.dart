import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.large,
    required this.width,
    required this.medium,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final bool  large;
  final double  width;
  final bool medium;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: onPressed,
      textColor: textColor,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width:   large ?   width / 4 : (  medium ?   width / 3.75 :   width / 3.5),
        decoration: buttonDecoration,
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: TextStyle(
            // fontWeight: FontWeight.w700,
            fontSize:   large ? 16 : (  medium ? 14 : 12),
          ),
        ),
      ),
    );
  }
}
