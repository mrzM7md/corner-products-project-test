import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_corner_products/core/theme/theme.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_states.dart';
import 'package:test_corner_products/features/products_categories/presentation/widgets/categories_listview.dart';
import 'package:test_corner_products/features/products_categories/presentation/widgets/option_item.dart';
import 'package:test_corner_products/features/products_categories/presentation/widgets/products_listview.dart';

class ProductsCategoriesScreen extends StatefulWidget {
  const ProductsCategoriesScreen({super.key});

  @override
  State<ProductsCategoriesScreen> createState() => _ProductsCategoriesScreenContentState();
}

class _ProductsCategoriesScreenContentState extends State<ProductsCategoriesScreen> {
  late ProductsCategoriesCubit _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProductsCategoriesCubit.get(context);
  }

  @override
  Widget build(BuildContext mainContext) {
    return SafeArea(
      child: SelectionArea(
        child: Scaffold(
            key: GlobalKey<ScaffoldState>(),
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
                                  _controller.getAllProducts();
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
                        builder: (context) => Column(
                          children: [

                            const CategoriesListview(),
                          ],
                        ),
                        fallback: (context) => const ProductsListview());
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

