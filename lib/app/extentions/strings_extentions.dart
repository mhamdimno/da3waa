import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

import '../../presentation/resources/constants_manager.dart';
import '../functios.dart';
import 'colors_extentions.dart';
import 'dart:ui' as ui;

extension stringsOptinalExtentions on String? {
  bool hasMatchs( String pattern) {
    return (this == null)
        ? false
        : RegExp(pattern).hasMatch(this.toEnglishNumbers());
  }
  bool get is_uppercase => this.isNullOrEmpty ? false : isUppercase(this!);

  Map<String, dynamic> toMap(){
    if (this==null){
      return {};
    }else{
      try {
        List<String> str = this!.replaceAll("{","").replaceAll("}","").replaceAll("\"","").replaceAll("'","").split(",");
        Map<String,dynamic> result = {};
        for(int i=0;i<str.length;i++){
          List<String> s = str[i].split(":");
          result.putIfAbsent(s[0].trim(), () => s[1].trim());
        }
        return result;
      } catch (_) {
        return {};

      }
    }

  }

  openUrl() async {
    try {
      final Uri uri = Uri.parse(this ?? "");
      await launchUrl(uri);
    } catch (_) {}
  }

  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }

  String toEnglishNumbers() {
    if (this == null) {
      return "";
    } else {
      var sb = new StringBuffer();
      for (int i = 0; i < this!.length; i++) {
        switch (this![i]) {
          //Persian digits
          case '\u06f0':
            sb.write('0');
            break;
          case '\u06f1':
            sb.write('1');
            break;
          case '\u06f2':
            sb.write('2');
            break;
          case '\u06f3':
            sb.write('3');
            break;
          case '\u06f4':
            sb.write('4');
            break;
          case '\u06f5':
            sb.write('5');
            break;
          case '\u06f6':
            sb.write('6');
            break;
          case '\u06f7':
            sb.write('7');
            break;
          case '\u06f8':
            sb.write('8');
            break;
          case '\u06f9':
            sb.write('9');
            break;

          //Arabic digits
          case '\u0660':
            sb.write('0');
            break;
          case '\u0661':
            sb.write('1');
            break;
          case '\u0662':
            sb.write('2');
            break;
          case '\u0663':
            sb.write('3');
            break;
          case '\u0664':
            sb.write('4');
            break;
          case '\u0665':
            sb.write('5');
            break;
          case '\u0666':
            sb.write('6');
            break;
          case '\u0667':
            sb.write('7');
            break;
          case '\u0668':
            sb.write('8');
            break;
          case '\u0669':
            sb.write('9');
            break;
          default:
            sb.write(this![i]);
            break;
        }
      }

      return sb.toString();
    }
  }

  String removeTags() {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return this == null ? "" : this!.replaceAll(exp, '');
  }

  bool get isNullOrEmpty =>
      this == null || this?.toLowerCase() == "null" || this?.trim() == "";
  bool get isNotNullOrEmpty =>
      !(this == null || this?.toLowerCase() == "null" || this?.trim() == "");
}

extension stringsExtentions on String {
  bool isNotJSON() {
    if (is_web){
    return false;

    }else {
      try {
        var _ = json.decode(this) as Map<String, dynamic>;
        return false;
      } on FormatException catch (e) {
        return true;
      }
    }
  }

  Future<Uint8List> getBytesFromAsset({required  double width}) async {
    ByteData data = await rootBundle.load("assets/images/${this}.png");
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width.toInt());
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  bool? get isNotPhone => this == null
      ? true
      : !(this.length > 8) ||
      toEnglishNumbers().hasMatchs(
              r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  openUrl() async {
    try {
      final Uri uri = Uri.parse(this);
      await launchUrl(uri);
    } catch (_) {}
  }

  String get safeNull => this == null ? "" : this;
  bool get isNumber => this == null ? false : double.tryParse(this) != null;
  int get toInt => this == null ? 0 : int.parse(this);
  int? get toIntOptinal => int.tryParse(this);

  double get toDouble => this == null ? 0 : double.tryParse(this) ?? 0;
  double? get toDoubleOptinal => double.tryParse(this);
  String get suffix => this.split('/').last;
  String  getFirstWords(int wordCounts) {
    return this.split(" ").sublist(0, wordCounts).join(" ");
  }
  String  removeFirstWords(int wordCounts) {
    return this.replaceAll(getFirstWords(wordCounts), "").trim();
  }
  String get to_multi_lines => this.replaceAll(" ", "\n");
  String  to_multi_lines_num(int v) => StringUtils.addCharAtPosition(this, "\n", v);

  Color get toColor =>
      ColorExtentions.fromHex(this[0] == "#" ? "${this}" : "#$this");
}
