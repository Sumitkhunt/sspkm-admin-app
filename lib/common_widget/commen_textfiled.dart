import 'package:flutter/material.dart';

class Commen_Textfiled extends StatelessWidget {
  const Commen_Textfiled({
    Key? key,
    this.ontap,
    this.onchange,
    this.validator,
    this.obscure = true,
    this.msxlength,
    this.ktype,
    this.controller,
    this.sufiixicon,
    this.preficicon,
    this.hinttext,
    this.filed,
    this.fillcolor,
    this.counter,
    this.border, this.labeltext, this.maxlen,
  }) : super(key: key);
  final void Function()? ontap;
  final void Function(String)? onchange;
  final String? Function(String?)? validator;
  final bool obscure;
  final msxlength;
  final ktype;
  final TextEditingController? controller;
  final sufiixicon;
  final preficicon;
  final hinttext;
  final bool? filed;
  final fillcolor;
  final counter;
  final border;
  final labeltext;
  final maxlen;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      // obscureText: obscure,
      onChanged: onchange,
      validator: validator,
      maxLength: msxlength,
      keyboardType: ktype,
      controller: controller,
      maxLines:maxlen,
      decoration: InputDecoration(
        border: border,
        counter: counter,
        fillColor: fillcolor,
        filled: filed,
        prefixIcon: preficicon,
        suffixIcon: sufiixicon,
        hintText: hinttext,
        labelText: labeltext,
        counterText: "",

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.indigo)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
