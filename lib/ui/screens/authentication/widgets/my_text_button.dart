import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const MyTextButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onPressed: onTap)
        ],
      ),
    );
  }
}
