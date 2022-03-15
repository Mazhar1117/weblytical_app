import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSocial;
  final String? logo;
  final Color color;

  const MyButton(
      {required this.title,
      required this.onTap,
      required this.isSocial,
      required this.logo,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            padding: MaterialStateProperty.all(isSocial == false
                ? const EdgeInsets.symmetric(horizontal: 70, vertical: 20)
                : const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isSocial != true
            ? Text(title, style: const TextStyle(fontSize: 20))
            : Row(children: [
                SizedBox(height: 30, width: 30, child: Image.asset(logo!)),
                const SizedBox(width: 10),
                Text(title, style: const TextStyle(fontSize: 20))
              ]),
        onPressed: onTap);
  }
}
