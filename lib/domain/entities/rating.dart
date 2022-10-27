import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final num? rate;
  final num? count;

  const Rating({
    this.rate,
    this.count,
  });

  @override
  List<Object> get props {
    return [
      rate!,
      count!,
    ];
  }

  @override
  bool get stringify => true;
}
