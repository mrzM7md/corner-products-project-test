import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_corner_products/core/theme/theme.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_states.dart';
import 'package:test_corner_products/features/products_categories/categories/usecases/get_all_categories_use_case.dart';
import 'package:test_corner_products/features/products_categories/presentation/widgets/categories_listview.dart';
import 'package:test_corner_products/features/products_categories/presentation/widgets/option_item.dart';

import '../../../core/services/services_locator.dart';

class ProductsCategoriesScreen extends StatelessWidget {
  const ProductsCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCategoriesCubit(
          getAllCategoriesUseCase: sl<GetAllCategoriesUseCase>()
      ),
      child: const ProductsCategoriesScreenContent(),
    );
  }
}


class ProductsCategoriesScreenContent extends StatefulWidget {
  const ProductsCategoriesScreenContent({super.key});

  @override
  State<ProductsCategoriesScreenContent> createState() => _ProductsCategoriesScreenContentState();
}

class _ProductsCategoriesScreenContentState extends State<ProductsCategoriesScreenContent> {
  late ProductsCategoriesCubit _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProductsCategoriesCubit.get(context);
    _controller.changeOptionSelectedState();
    _controller.getAllCategories();
  }

  @override
  Widget build(BuildContext mainContext) {
    return SafeArea(
      child: SelectionArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Padding(
                padding:
                EdgeInsetsDirectional.only(top: 20.h, start: 15.w, end: 15.w),
                child: Column(
                  children: [
                    BlocBuilder<ProductsCategoriesCubit, ProductsCategoriesState>(
                      buildWhen: (previous, current) =>
                      current is ChangeOptionSelectedState,
                      builder: (context, state) {
                        return Row(
                          children: [
                            InkWell(
                              child: OptionItem(
                                name: "Products",
                                bgColor: _controller.isCategoriesOptionSelected()
                                    ? ColorsManager.color.Neutral_400
                                    :  ColorsManager.color.Success_200,
                              ),
                              onTap: () {
                                if(! isClickedOnSameOption(isThisCategoriesOption:false)){
                                  _controller.changeOptionSelectedState();
                                }
                              },
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              child: OptionItem(
                                name: "Categories",
                                bgColor: _controller.isCategoriesOptionSelected()
                                    ? ColorsManager.color.Success_200
                                    : ColorsManager.color.Neutral_400,
                              ),
                              onTap: () {
                                if(! isClickedOnSameOption(isThisCategoriesOption:true)){
                                  _controller.changeOptionSelectedState();
                                  _controller.getAllCategories();
                                }
                                },
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 15.h,),
                BlocBuilder<ProductsCategoriesCubit, ProductsCategoriesState>(
                  buildWhen: (previous, current) =>
                      current is ChangeOptionSelectedState,
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: _controller.isCategoriesOptionSelected(),
                        builder: (context) => const CategoriesListview(),
                        fallback: (context) => Container());
                  },
                )
              ],
            ),
              )),
        ),
      ),
    );
  }

  bool isClickedOnSameOption({required bool isThisCategoriesOption}) => isThisCategoriesOption == _controller.isCategoriesOptionSelected();
}

