import 'package:flutter/material.dart';
import 'package:vulog_technical_test/constants/app_colors.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  const StarRating(
      {super.key,
      this.starCount = 5,
      this.rating = .0,
      this.onRatingChanged,
      this.color});

  final double iconSize = 15;

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: color ?? AppColors.starUnreachedColor,
        size: iconSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color ?? AppColors.starReachedColor,
        size: iconSize,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? AppColors.starReachedColor,
        size: iconSize,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
