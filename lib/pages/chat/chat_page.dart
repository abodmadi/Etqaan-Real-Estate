import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomBigText(
        text: S.of(context).chats,
        fontSize: 18.sp,
        textColor: AppColors.mainIconColor,
        fontFamily: 'GESSTwo',
      ),
    );
  }
}
