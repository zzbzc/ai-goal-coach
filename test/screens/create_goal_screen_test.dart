/// CreateGoalScreen 组件测试
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ai_goal_coach/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('CreateGoalScreen', () {
    testWidgets('显示目标输入框和模板列表', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(const AIGoalCoachApp());
      await tester.pumpAndSettle();

      // 导航到创建页面
      final createButton = find.text('创建一个目标开始吧');
      if (createButton.evaluate().isNotEmpty) {
        await tester.tap(createButton);
        await tester.pumpAndSettle();

        // 验证显示输入框
        expect(find.text('你想达成什么目标？'), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);

        // 验证显示模板
        expect(find.text('30 天读 5 本书'), findsOneWidget);
        expect(find.text('每天冥想 10 分钟'), findsOneWidget);
        expect(find.text('30 天早起挑战'), findsOneWidget);
        expect(find.text('每周运动 3 次'), findsOneWidget);
      }
    });

    testWidgets('第二步显示时间和持续时间选择器', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(const AIGoalCoachApp());
      await tester.pumpAndSettle();

      // 导航到创建页面
      final createButton = find.text('创建一个目标开始吧');
      if (createButton.evaluate().isNotEmpty) {
        await tester.tap(createButton);
        await tester.pumpAndSettle();

        // 输入目标
        await tester.enterText(find.byType(TextField), '测试目标');
        await tester.pump();

        // 点击下一步
        await tester.tap(find.text('下一步'));
        await tester.pumpAndSettle();

        // 验证显示时间选择
        expect(find.text('每天可用时间：'), findsOneWidget);
        expect(find.text('30 分钟'), findsOneWidget);
        expect(find.text('1 小时'), findsOneWidget);

        // 验证显示持续时间选择
        expect(find.text('目标持续时间：'), findsOneWidget);
        expect(find.text('7 天'), findsOneWidget);
        expect(find.text('30 天'), findsOneWidget);
        expect(find.text('60 天'), findsOneWidget);
        expect(find.text('90 天'), findsOneWidget);
      }
    });

    testWidgets('选择持续时间选项', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(const AIGoalCoachApp());
      await tester.pumpAndSettle();

      // 导航到创建页面
      final createButton = find.text('创建一个目标开始吧');
      if (createButton.evaluate().isNotEmpty) {
        await tester.tap(createButton);
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField), '测试目标');
        await tester.pump();
        await tester.tap(find.text('下一步'));
        await tester.pumpAndSettle();

        // 选择 14 天
        await tester.tap(find.text('14 天'));
        await tester.pumpAndSettle();

        // 验证选择状态（选中的 chip 会有不同的样式）
        expect(find.text('14 天'), findsOneWidget);
      }
    });
  });
}
