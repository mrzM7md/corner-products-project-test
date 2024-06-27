import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_corner_products/core/constants/widgets_components.dart';
import 'package:test_corner_products/core/network/server_exception.dart';
import 'package:test_corner_products/core/theme/styles.dart';
import 'package:test_corner_products/core/utilities/images.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_states.dart';

class CategoriesListview extends StatelessWidget {
  const CategoriesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCategoriesCubit, ProductsCategoriesState>(
      buildWhen: (previous, current) => current is GetAllCategoriesState,
      builder: (context, state) {
        try{
          if(state is !GetAllCategoriesState || state.isLoaded == false){
            return const Center(child: CircularProgressIndicator(),);
          }
          List data = state.categories;
          if(data.isEmpty){
            return buildNoData(image: Images.noDataImage, text: "Empty");
          }
          return
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (context, index) =>
                    Text(data[index], style: TextStyles.font12Medium(), ),
                separatorBuilder: (context, index) => const Divider() ,
                itemCount: data.length
            );
        } catch (ex){
          if(ex is ServerException){
            return Center(child: Text(ex.errorMessageModel.statusMessage),);
          }
          return const Center(child: Text("Check Your Connection"),);
        }
      },
    );
  }
}
