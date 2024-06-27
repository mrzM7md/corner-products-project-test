import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_corner_products/core/constants/widgets_components.dart';
import 'package:test_corner_products/core/network/server_exception.dart';
import 'package:test_corner_products/core/utilities/images.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_states.dart';
import 'package:test_corner_products/features/products_categories/presentation/widgets/product_item.dart';
import 'package:test_corner_products/features/products_categories/products/models/product_model.dart';

class ProductsListview extends StatelessWidget {
  const ProductsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCategoriesCubit, ProductsCategoriesState>(
      buildWhen: (previous, current) => current is GetAllProductsState,
      builder: (context, state) {
        try{
          if(state is !GetAllProductsState || state.isLoaded == false){
            return const Center(child: CircularProgressIndicator(),);
          }
          List<ProductModel> data = state.products;
          if(data.isEmpty){
            return buildNoData(image: Images.noDataImage, text: "No Products Added Yet");
          }
          return
            ListView.separated(
              padding: EdgeInsetsDirectional.only(bottom: 10.h),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (context, index) => ProductItem(product: data[index]),
                separatorBuilder: (context, index) => SizedBox(height: 5.5.h,) ,
                itemCount: data.length
            );
        } catch (ex){
          if(ex is ServerException){
            return Center(child: Text(ex.errorMessageModel.statusMessage),);
          }
          return const Center(child: Text("Empty"),);
        }
      },
    );
  }
}
