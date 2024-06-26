import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_corner_products/core/utilities/images.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 350,
        width: 350,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Images.notFound404Image)),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
