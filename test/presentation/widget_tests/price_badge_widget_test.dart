import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vulog_technical_test/constants/app_colors.dart';
import 'package:vulog_technical_test/presentation/ui/products/common/price_badge_widget.dart';

void main() {
  setUp(() {});

  const price = 230;

  testWidgets(
    "check price badge configs and display",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const Material(
          child: Directionality(
              textDirection: TextDirection.rtl, child: PriceBadgeWidget(price)),
        ),
      );
      expect(find.byType(Card), findsOneWidget);
      expect(find.text("230\$"), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect((tester.firstWidget(find.byType(Card)) as Card).color,
          AppColors.darkGrey);
    },
  );
}
