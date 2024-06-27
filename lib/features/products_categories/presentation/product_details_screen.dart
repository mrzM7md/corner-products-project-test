import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_corner_products/core/theme/styles.dart';
import 'package:test_corner_products/core/theme/theme.dart';
import 'package:test_corner_products/core/utilities/images.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/products/models/product_model.dart';


class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  ProductDetailsScreen({super.key, required this.productId});
  
  @override
  Widget build(BuildContext context) {
    var controller = ProductsCategoriesCubit.get(context);
    ProductModel product = controller.showProductDetails(productTd: int.parse(productId));

    return SelectionArea(
      child: Scaffold(
        key: GlobalKey<ScaffoldState>(),
        body: CustomScrollView(
          key: GlobalKey(),
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              backgroundColor: Colors.black38,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: ConditionalBuilder(
                          condition:
                          product.image != null && product.image!.isNotEmpty,
                          builder: (ctx) =>
                            Image.network(
                              product.image!, fit: BoxFit.fill,
                            width: 50.w,
                            height: 50.h,
                          ),
                          fallback: (ctx) => Image.asset(
                            Images.appLogoImage,
                            fit: BoxFit.fill,
                            width: 50.w,
                            height: 50.h,
                          ),
                        )
                      ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 10, top: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                              color: ColorsManager.color.Yellow_3,
                            ),
                            padding: EdgeInsetsDirectional.all(5.w),
                            margin: EdgeInsetsDirectional.only(bottom: 8.h),
                            child: Text(product.category ?? "no category", style: TextStyles.font10Regular(),),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: ColorsManager.color.Yellow_1,size: 14.w,),
                              Text("${product.rating == null ? 0.0 : product.rating!.rate}", style: TextStyles.font12Regular(),),
                              SizedBox(width: 8.w ,),
                              Icon(CupertinoIcons.person_3 ,size: 14.w,),
                              Text("${product.rating == null ? 0.0 : product.rating!.count}", style: TextStyles.font12Regular(),),
                              const Spacer(),
                              Icon(CupertinoIcons.money_dollar_circle_fill, color: ColorsManager.color.Yellow_1,size: 14.w,),
                              Text("${product.price}", style: TextStyles.font12Regular(),),
                            ],),

                          SizedBox(height: 12.h,),

                          Text(product.title ?? "",
                            style: TextStyles.font12Medium().copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(color: ColorsManager.color.Yellow_3,),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 10, top: 40),
                      child: Text(product.description ?? "", style: TextStyles.font12Medium(),),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
