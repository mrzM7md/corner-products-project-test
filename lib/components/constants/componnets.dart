import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_corner_products/components/theme/theme.dart';

Widget appButton({
  required backgroundColor,
  required text,
  required onPressed,
}){
  return ElevatedButton
    (

    onPressed: onPressed,
    style: ElevatedButton.styleFrom
      (
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 100 , vertical: 17),
        backgroundColor: backgroundColor ,
        foregroundColor: AppColors().Neutral_0,
        shape: RoundedRectangleBorder
          (
          borderRadius: BorderRadius.circular(19),
        )

    ),
    child: Text(text , style: const TextStyle(fontSize: 18, color: Colors.black87),),
  );
}


Widget appTextField ({
  TextInputType keyboardType = TextInputType.text,
  String? Function(String? value)? validate,
  Widget? preIcon, required controller, required bool obscureText, required String hintText,
  required Function(dynamic value) onChange
}) {
  return TextFormField(
    validator: validate,
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixIcon: preIcon,
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey[500]),),
    onChanged: onChange,
    keyboardType: keyboardType,
  );
}

Widget buildNoData({required String image, required String text})=>SingleChildScrollView(
  child: SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50,),
        Image.asset(image, fit: BoxFit.fill, width: 220,),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 20),
          child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
        ),
        const SizedBox(height: 50,),
      ],
    ),
  ),
);

Widget appText({Color color = Colors.black87 , align = TextAlign.start, required String text, required double fontSize, required int? maxLines, required bool isBold}) {
  return Text(text, style: TextStyle(
      fontSize: fontSize,
      fontWeight: isBold ? FontWeight.bold : null,
    color: color,
  ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: align,
  );
}


Widget appButtonImage({required onClick, required icon}){
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        color: AppColors().Neutral_0,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors().Neutral_150)),
    child: IconButton(
        onPressed: onClick,
        icon:icon
    ),
  );
}
