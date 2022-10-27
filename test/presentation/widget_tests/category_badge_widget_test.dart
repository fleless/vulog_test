import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vulog_technical_test/constants/app_colors.dart';
import 'package:vulog_technical_test/data/models/enum/category_enum.dart';
import 'package:vulog_technical_test/domain/entities/product.dart';
import 'package:vulog_technical_test/domain/entities/rating.dart';
import 'package:vulog_technical_test/presentation/ui/products/common/category_badge_widget.dart';

void main() {
  setUp(() {});

  const product = Product(
    id: 100,
    title: "product 1",
    price: 100,
    description: 'description pro1',
    category: CategoryEnum.ELECTRONICS,
    image: "",
    rating: Rating(rate: 3, count: 122),
  );

  testWidgets(
    "check caategory badge configs and display",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const Material(
          child: Directionality(
              textDirection: TextDirection.rtl, child: CategoryBadgeWidget(product)),
        ),
      );
      expect(find.byType(Card), findsOneWidget);
      expect(find.text(product.category!.name), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect((tester.firstWidget(find.byType(Card)) as Card).color,
          AppColors.electronicsColors);
    },
  );
}
