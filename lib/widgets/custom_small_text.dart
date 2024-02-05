import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomSmallText extends StatelessWidget {
  final String text;
  Color? textColor;
  Color? backColor;
  double? fontSize;
  double? height;
  int? maxLines;
  String? fontFamily;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  CustomSmallText({
    super.key,
    required this.text,
    this.textColor = const Color(0xFF83829A),
    this.fontSize = 0,
    this.backColor,
    this.height,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.fontFamily = 'GESSTwo',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        height: height,
        color: textColor,
        fontSize: fontSize == 0 ? Dimensions.fontSize12 : fontSize,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        backgroundColor: backColor,
      ),
    );
  }
}
