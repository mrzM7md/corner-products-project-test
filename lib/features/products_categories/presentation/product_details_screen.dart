import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_corner_products/core/theme/styles.dart';
import 'package:test_corner_products/core/utilities/images.dart';
import 'package:test_corner_products/features/products_categories/bussiness/products_categories_cubit.dart';
import 'package:test_corner_products/features/products_categories/products/models/product_model.dart';


class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductModel product;

  @override
  void initState() {
    super.initState();
    product = ProductsCategoriesCubit.get(context).getProducts().firstWhere((p) => p.id == int.parse(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    late GlobalKey<ScaffoldState> scaffoldKey  = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Colors.black38,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(product.title ?? "", style: TextStyles.font12Medium(),),
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
                    child: Text(product.title ?? "",
                      style: TextStyles.font12Medium().copyWith(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                      ),
                    )
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
    );
  }
}
