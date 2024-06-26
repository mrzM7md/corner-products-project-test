import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable{
  final List<String>? categories;

  const CategoriesModel({required this.categories});

  factory CategoriesModel.fromJson({required Map<String, dynamic> json}) {
    return CategoriesModel(categories: List.from((json['data'] as List).map((e) => e) ));
  }

  @override
  List<Object?> get props => [categories];
}