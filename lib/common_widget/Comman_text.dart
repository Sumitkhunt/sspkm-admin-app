import 'package:flutter/material.dart';

class Comman_Text extends StatelessWidget {
  const Comman_Text(
      {Key? key,
      this.text,
      this.color,
      this.fontsize,
      this.fontweight,
      this.decoration})
      : super(key: key);

  final text;
  final color;
  final decoration;
  final double? fontsize;
  final FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
    );
  }
}
