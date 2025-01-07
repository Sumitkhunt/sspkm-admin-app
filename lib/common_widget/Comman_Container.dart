import 'package:flutter/material.dart';

class Comman_Container extends StatelessWidget {
  const Comman_Container({
    Key? key,
    this.width,
    this.child,
    this.height,
    this.gradient,
    this.color,
    this.image,
    this.border,
    this.BorderRadius,
    this.BoxShadow,
    this.ontap,
    this.margin,
  }) : super(key: key);

  final width;
  final child;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;
  final color;
  final DecorationImage? image;
  final BoxBorder? border;
  final BorderRadiusGeometry? BorderRadius;
  final BoxShadow;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        margin: margin,
        height: height,
        child: child,
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          image: image,
          borderRadius: BorderRadius,
          border: border,
          boxShadow: BoxShadow,
        ),
      ),
    );
  }
}
