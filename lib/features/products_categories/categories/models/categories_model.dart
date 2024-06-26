import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable{
  final List<String>? categories;

  const CategoriesModel({required this.categories});

  factory CategoriesModel.fromJson({required Map<String, dynamic> json}) {
    return CategoriesModel(categories: json['categories'].cast<String>());
  }

  @override
  List<Object?> get props => [categories];
}