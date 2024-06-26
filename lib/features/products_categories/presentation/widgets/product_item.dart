import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_corner_products/core/routes/app_routes.dart';
import 'package:test_corner_products/core/theme/styles.dart';
import 'package:test_corner_products/core/theme/theme.dart';
import 'package:test_corner_products/core/utilities/images.dart';
import 'package:test_corner_products/features/products_categories/products/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(AppRoutes.detailsRouter,
          pathParameters: {'product_id': "${product.id}"},);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: ColorsManager.color.Yellow_5,
        ),
        child: Row(
          children: [
            ConditionalBuilder(
              condition: product.image != null && product.image!.isNotEmpty,
              builder: (context) => CircleAvatar(radius: 30.w, backgroundImage: NetworkImage(product.image!)),
              fallback: (context) => CircleAvatar(radius: 30.w, backgroundImage: const AssetImage(Images.appLogoImage)),
            ),
            SizedBox(width: 5.w,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title ?? "", style: TextStyles.font10Medium().copyWith(overflow: TextOverflow.ellipsis),),
                    Row(
                      children: [
                        Icon(Icons.star, color: ColorsManager.color.Yellow_1,size: 12.w,),
                        Text("${product.rating == null ? 0.0 : product.rating!.rate}", style: TextStyles.font10Regular(),),
                        SizedBox(width: 8.w ,),
                        Icon(CupertinoIcons.person_3,size: 12.w,),
                        Text("${product.rating == null ? 0.0 : product.rating!.count}", style: TextStyles.font10Regular(),),
                        const Spacer(),
                        Icon(CupertinoIcons.money_dollar_circle_fill, color: ColorsManager.color.Yellow_1,size: 12.w,),
                        Text("${product.price}", style: TextStyles.font10Regular(),),
                    ],)
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
