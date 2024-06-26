import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_corner_products/core/routes/routes_manager.dart';
import 'package:test_corner_products/core/theme/theme.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';

import 'core/services/services_locator.dart';

class CornerApp extends StatelessWidget {
  const CornerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => sl<ProductsCategoriesCubit>(),
        child: MaterialApp.router(
          routerConfig: RoutesManager.router,
          title: 'Corner Test',
          theme: ThemeData(
            primaryColor: ColorsManager.color.Success_200,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
