import 'package:flutter/material.dart';

class Comman_TexxtFiled extends StatelessWidget {
  const Comman_TexxtFiled(
      {Key? key,
      this.ontap,
      this.onChanged,
      this.maxLength,
      this.border,
      this.obscureText = false,
      this.keyboardType,
      this.controller,
      this.errorBorder,
      this.enabledBorder,
      this.hinttext,
      this.labletext,
      this.counter,
      this.disableborder,
      this.fillcolor,
      this.prefixicon,
      this.sufficicon,
      this.filled,
      this.focouseborder,
      this.validator,
      this.FocusedErrorBorder})
      : super(key: key);
  final void Function()? ontap;
  final void Function(String)? onChanged;
  final maxLength;
  final border;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final focouseborder;
  final errorBorder;
  final enabledBorder;
  final hinttext;
  final labletext;
  final counter;
  final FocusedErrorBorder;
  final disableborder;
  final fillcolor;
  final prefixicon;
  final sufficicon;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onTap: ontap,
      keyboardType: keyboardType,
      controller: controller,
      maxLength: maxLength,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: border,
        hintText: hinttext,
        labelText: labletext,
        counter: counter,
        filled: filled,
        suffixIcon: sufficicon,
        prefixIcon: prefixicon,
        fillColor: fillcolor,
        counterText: "",
        focusedErrorBorder: FocusedErrorBorder,
        disabledBorder: disableborder,
        errorBorder: errorBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focouseborder,
      ),
    );
  }
}
