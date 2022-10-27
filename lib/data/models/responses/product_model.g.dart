// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as num?,
      title: json['title'] as String?,
      price: json['price'] as num?,
      description: json['description'] as String?,
      category: $enumDecodeNullable(_$CategoryEnumEnumMap, json['category']),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': _$CategoryEnumEnumMap[instance.category],
      'image': instance.image,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.MEN_S_CLOTHING: 'MEN_S_CLOTHING',
  CategoryEnum.JEWELERY: 'JEWELERY',
  CategoryEnum.ELECTRONICS: 'ELECTRONICS',
  CategoryEnum.WOMEN_S_CLOTHING: 'WOMEN_S_CLOTHING',
};
