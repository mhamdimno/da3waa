import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:da3wa/app/extentions/strings_extentions.dart';

extension ColorExtentions on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String? hexString) {
    if (hexString.isNullOrEmpty) {
      return Colors.transparent;
    }
    final buffer = StringBuffer();
    if (hexString == null || hexString.isNullOrEmpty || hexString.length < 4) {
      return Colors.black;
    }
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.tryParse(buffer.toString(), radix: 16) ?? 0);
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
