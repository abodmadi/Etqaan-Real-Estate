import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomBigText extends StatelessWidget {
  final String text;
  Color? textColor;
  Color? backColor;
  double? fontSize;
  String? fontFamily;
  CustomBigText({
    super.key,
    required this.text,
    this.textColor = const Color(0xff494948),
    this.fontSize = 0,
    this.backColor,
    this.fontFamily = 'ReadexPro',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      
      style: TextStyle(
        color: textColor,
        fontSize: fontSize == 0 ? Dimensions.fontSize14 : fontSize,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        backgroundColor: backColor,
      ),
    );
  }
}
