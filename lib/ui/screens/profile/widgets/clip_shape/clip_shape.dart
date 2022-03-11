import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../widgets/custom_shape.dart';
import '../../../../widgets/responsive_ui.dart';

class ClipShape extends StatelessWidget {
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

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
                    ))))
      ],
    );
  }
}
