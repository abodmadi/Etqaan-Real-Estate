import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;
  ImageProvider? image;
  double? radius;
  Color? color;
  BoxBorder? border;
  EdgeInsetsGeometry? padding;
  CustomContainer({
    Key? key,
    this.width = 0,
    this.height = 0,
    this.image,
    this.radius = 0,
    this.child,
    this.border,
    this.padding,
    this.color = const Color(0xFFFF7754),
  });

  @override
  Widget build(BuildContext context) {
    return image != null
        ? Container(
            padding: padding,
            width: width == 0 ? 60.w : width,
            height: height == 0 ? 60.h : height,
            decoration: BoxDecoration(
              color: color,
              border: border,
              borderRadius: BorderRadius.circular(
                radius == 0 ? 12.r : radius!,
              ),
              image: DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: child,
            ),
          )
        : Container(
            padding: padding,
            width: width == 0 ? 60.w : width,
            height: height == 0 ? 60.h : height,
            decoration: BoxDecoration(
              color: color,
              border: border,
              borderRadius: BorderRadius.circular(
                radius == 0 ? 12.r : radius!,
              ),
            ),
            child: Center(
              child: child,
            ),
          );
  }
}
