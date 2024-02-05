import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomBigText extends StatelessWidget {
  final String text;
  Color? textColor;
  Color? backColor;
  double? fontSize;
  double? height;
  String? fontFamily;
  int? maxLines;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  CustomBigText({
    super.key,
    required this.text,
    this.textColor = const Color(0xff494948),
    this.fontSize = 0,
    this.backColor,
    this.height,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.fontFamily = 'GESSTwo',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        height: height,
        color: textColor,
        fontSize: fontSize == 0 ? Dimensions.fontSize14 : fontSize,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        backgroundColor: backColor,
      ),
    );
  }
}
