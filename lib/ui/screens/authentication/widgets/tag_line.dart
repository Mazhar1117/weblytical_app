import 'package:flutter/material.dart';

class TagLine extends StatelessWidget {
  final String title;
  final String tag;

  const TagLine({required this.title, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Text(tag,
            style: const TextStyle(color: Colors.grey, fontSize: 20)),
      ],
    );
  }
}
