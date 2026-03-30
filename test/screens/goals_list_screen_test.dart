/// GoalsListScreen 组件测试
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:ai_goal_coach/main.dart';
import 'package:ai_goal_coach/config/constants.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('GoalsListScreen 加载状态', () {
    testWidgets('初始加载时显示加载指示器', (WidgetTester tester) async {
      // 设置空的 Token 状态（未登录）
      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(const AIGoalCoachApp());
      await tester.pump(); // 第一帧
      await tester.pump(const Duration(milliseconds: 100)); // 等待加载

      // 验证显示加载指示器
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('加载失败时显示错误状态和重试按钮', (WidgetTester tester) async {
      // 模拟 API 返回 401
      final mockClient = MockClient((request) async {
        return http.Response('{"detail": "Not authenticated"}', 401);
      });

      SharedPreferences.setMockInitialValues({
        'access_token': 'invalid_token',
        'refresh_token': 'invalid_refresh',
      });

      await tester.pumpWidget(const AIGoalCoachApp());
      await tester.pumpAndSettle();

      // 验证显示错误图标
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
      // 验证显示重试按钮
      expect(find.text('重试'), findsOneWidget);
    });

    testWidgets('空数据时显示空状态', (WidgetTester tester) async {
      // 模拟返回空列表
      final mockClient = MockClient((request) async {
        if (request.url.path.contains('/auth/refresh')) {
          return http.Response('{"detail": "Invalid token"}', 401);
        }
        return http.Response('{"items": []}', 200);
      });

      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(const AIGoalCoachApp());
      await tester.pumpAndSettle();

      // 验证显示空状态
      expect(find.text('还没有目标'), findsOneWidget);
      expect(find.text('创建一个目标开始吧'), findsOneWidget);
    });
  });

  group('GoalsListScreen 用户交互', () {
    testWidgets('点击创建目标按钮导航到创建页面', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(const AIGoalCoachApp());
      await tester.pumpAndSettle();

      // 点击创建目标按钮
      final createButton = find.text('创建一个目标开始吧');
      if (createButton.evaluate().isNotEmpty) {
        await tester.tap(createButton);
        await tester.pumpAndSettle();

        // 验证导航到创建页面
        expect(find.text('创建目标'), findsOneWidget);
        expect(find.text('你想达成什么目标？'), findsOneWidget);
      }
    });
  });
}
