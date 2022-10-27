import 'package:equatable/equatable.dart';
import 'package:vulog_technical_test/constants/app_colors.dart';
import 'package:vulog_technical_test/data/models/enum/category_enum.dart';
import 'package:vulog_technical_test/domain/entities/rating.dart';

class Product extends Equatable {
  final num? id;
  final String? title;
  final num? price;
  final String? description;
  final CategoryEnum? category;
  final String? image;
  final Rating? rating;

  const Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  List<Object> get props {
    return [
      id!,
      title!,
      price!,
      description!,
      category!,
      image!,
      rating!,
    ];
  }

  @override
  bool get stringify => true;

  getColorOfCategory() {
    switch (category) {
      case CategoryEnum.ELECTRONICS:
        return AppColors.electronicsColors;
      case CategoryEnum.MEN_S_CLOTHING:
        return AppColors.menClothesColors;
      case CategoryEnum.WOMEN_S_CLOTHING:
        return AppColors.womenClothesColors;
      case CategoryEnum.JEWELERY:
        return AppColors.jeweleryColors;
      default:
        return AppColors.darkGrey;
    }
  }
}
