import 'package:json_annotation/json_annotation.dart';
import 'package:vulog_technical_test/data/models/enum/category_enum.dart';
import 'package:vulog_technical_test/data/models/rating_model.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  const ProductModel({
    num? id,
    String? title,
    num? price,
    String? description,
    CategoryEnum? category,
    String? image,
    RatingModel? ratingModel,
  }) : super(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            rating: ratingModel);

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as num,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: categoryValues.map[map["category"]],
      image: map['image'] as String,
      ratingModel: map['rating'] != null
          ? RatingModel.fromJson(map['rating'] as Map<String, dynamic>)
          : null,
    );
  }
}

