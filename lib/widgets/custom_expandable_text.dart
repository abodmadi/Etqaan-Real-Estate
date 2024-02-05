import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpandableText extends StatefulWidget {
  final String text;
  final double textHeight;
  const CustomExpandableText({
    super.key,
    required this.text,
    required this.textHeight,
  });

  @override
  State<CustomExpandableText> createState() => _CustomExpandableTextState();
}

class _CustomExpandableTextState extends State<CustomExpandableText> {
  late String firstHalf;
  late String secundHalf;
  bool hiddenText = true;
  //double textHeight = Dimensions.screenHeight / 7.81;
  //double textHeight = 100.h;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.textHeight) {
      firstHalf = widget.text.substring(0, widget.textHeight.toInt());
      secundHalf = widget.text
          .substring(widget.textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secundHalf = '';
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secundHalf.isEmpty
          ? CustomBigText(
              textColor: AppColors.smallTextColor,
              height: 1.5,
              fontSize: 12.sp,
              text: firstHalf,
              fontFamily: 'GESSTwo',
            )
          : Column(
              children: [
                CustomBigText(
                    height: 1.5,
                    textColor: AppColors.smallTextColor,
                    fontSize: 12.sp,
                    fontFamily: 'GESSTwo',
                    text: hiddenText
                        ? (firstHalf + '...')
                        : (firstHalf + secundHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      CustomBigText(
                        text: hiddenText
                            ? S.of(context).show_more
                            : S.of(context).show_less,
                        fontFamily: 'GESSTwo',
                        fontSize: 12.sp,
                        textColor: AppColors.mainIconColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: AppColors.mainIconColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
