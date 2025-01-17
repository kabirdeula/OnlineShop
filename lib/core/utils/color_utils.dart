import 'package:flutter/material.dart';

Color hexToColor(String hexColor) {
  hexColor = hexColor.replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor'; // Add alpha value if not provided
  }
  return Color(int.parse('0x$hexColor'));
}
