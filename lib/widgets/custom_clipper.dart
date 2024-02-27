import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSocialClipper extends StatelessWidget {
  final Color color;
  final List<Offset> points;
  final double width;
  final double height;
  final Widget widget;
  CustomSocialClipper({
    super.key,
    required this.color,
    required this.points,
    required this.width,
    required this.height,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(points: points),
      child: Container(
        width: width,
        height: height,
        color: color,
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final List<Offset> points;

  MyClipper({required this.points});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0)
      ..addPolygon(points, true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
