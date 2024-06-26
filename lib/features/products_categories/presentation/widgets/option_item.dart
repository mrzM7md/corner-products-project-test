import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_corner_products/core/constants/widgets_components.dart';
import 'package:test_corner_products/core/theme/styles.dart';

class OptionItem extends StatelessWidget {
  final String name;
  final Color bgColor;

  const OptionItem({required this.bgColor, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: bgColor,
      ),
      child: Text(name, style: TextStyles.font10Regular(),),
    );
  }
}
