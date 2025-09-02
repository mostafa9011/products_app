import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/product_model/rating.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final Rating rating;
  @HiveField(7)
  bool isFavorite;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.isFavorite = false,
  });

  ProductEntity copyWith({
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
    bool? isFavorite,
  }) {
    return ProductEntity(
      id: id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
