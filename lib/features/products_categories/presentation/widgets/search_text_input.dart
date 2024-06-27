import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_corner_products/core/theme/theme.dart';

class SearchTextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChange;
  const SearchTextInput({super.key, required this.hintText, required this.controller, required this.onChange});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: onChange,
          decoration: InputDecoration(
            hintMaxLines: 1,
            hintText: hintText,
            suffixIcon: const Icon(Icons.search),
            focusColor: ColorsManager.color.Yellow_2,
            border: InputBorder.none,
          ),
          textAlign: TextAlign.start,
          controller: controller,
          keyboardType: TextInputType.name,
        ),

        SizedBox(height: 8.h,)
      ],
    );
  }
}
