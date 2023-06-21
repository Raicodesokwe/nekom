import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_color.dart';

class TextBoxInput extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? suffixIcon;
  final double? width;

  final TextEditingController? controller;
  const TextBoxInput(
      {Key? key,
      this.onChanged,
      this.validator,
      this.keyboardType,
      this.width,
      this.hintText,
      this.suffixIcon,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width ?? size.width * 0.4,
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: AppColor.blackColor.withOpacity(0.5)),
            color: AppColor.whiteColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0)),
        child: TextFormField(
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          cursorColor: Colors.black54,
          style: GoogleFonts.prompt(color: Colors.black54),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.prompt(color: Colors.black54),
              border: InputBorder.none),
        ));
  }
}
