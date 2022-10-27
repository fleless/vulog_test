import 'package:json_annotation/json_annotation.dart';
import 'package:vulog_technical_test/domain/entities/rating.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel extends Rating {
  const RatingModel({
    num? rate,
    num? count,
  }) : super(
          rate: rate,
          count: count,
        );

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'] as num,
      count: json['count'] as num,
    );
  }
}
