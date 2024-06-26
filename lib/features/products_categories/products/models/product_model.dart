import 'package:test_corner_products/features/products_categories/products/models/rating_model.dart';

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;

  ProductModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  ProductModel.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? RatingModel.fromJson(json: json['rating']) : null;
  }
}