import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';

class StatsInfo {
  final String? title, totalCount;
  final Icon? icon;
  // final int? numOfFiles, percentage;
  // final Color? color;

  StatsInfo({
    this.icon,
    this.title,
    this.totalCount,
  });
}

List demoMyFiles = [
  StatsInfo(
    title: "Impressions",
    icon: Icon(Icons.remove_red_eye),
    totalCount: "9.5K",
  ),
  StatsInfo(
    title: "Clicks",
    icon: Icon(Icons.mouse_outlined),
    totalCount: "4.3K",
  ),
  StatsInfo(
    title: "Engagements",
    icon: Icon(Icons.people_alt),
    totalCount: "21K",
  ),
  StatsInfo(
    title: "Posts",
    icon: Icon(Icons.camera_outlined),
    totalCount: "147",
  ),
];
