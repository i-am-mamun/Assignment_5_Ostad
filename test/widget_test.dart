import 'package:flutter_test/flutter_test.dart';

import 'package:module_5/main.dart';

void main() {
  testWidgets('profile screen displays content and responds to add', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('My Profile'), findsOneWidget);
    expect(find.text('Ice cream is very delicious right?'), findsOneWidget);
    expect(find.text('Programming is not boring if you love it'), findsOneWidget);

    await tester.tap(find.byTooltip('Add'));
    await tester.pump();

    expect(find.text('Add a new profile item'), findsOneWidget);
  });
}
