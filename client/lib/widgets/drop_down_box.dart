import 'package:app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? selectedValue;
  final String? hintText;
  final List? dropdownData;
  final double? width;
  final void Function(String?)? onChanged;
  const DropDownWidget(
      {Key? key,
      this.validator,
      this.selectedValue,
      this.width,
      this.hintText,
      this.onChanged,
      this.dropdownData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: width ?? size.width * 0.4,
      decoration: BoxDecoration(
          border:
              Border.all(color: Colors.black45.withOpacity(0.5), width: 2.0),
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonFormField<String>(
          // validator: (value) =>validate(),
          isExpanded: true,
          validator: validator,
          hint: Text(
            hintText!,
            style: GoogleFonts.prompt(color: Colors.black54),
          ),
          value: selectedValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          onChanged: onChanged,
          items: dropdownData!.toSet().map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value!,
                ));
          }).toList(),
          decoration: InputDecoration(
            border: InputBorder.none,
          )),
    );
  }
}
