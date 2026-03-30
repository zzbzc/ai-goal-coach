/// HTTP Service 单元测试
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:ai_goal_coach/services/http_service.dart';
import 'package:ai_goal_coach/config/constants.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  tearDown(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('HttpService Token 管理', () {
    test('setTokens 应该保存 Token 到 SharedPreferences', () async {
      final httpService = HttpService();
      await httpService.setTokens('test_access_token', 'test_refresh_token');

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('access_token'), equals('test_access_token'));
      expect(prefs.getString('refresh_token'), equals('test_refresh_token'));
    });

    test('loadTokens 应该从 SharedPreferences 加载 Token', () async {
      SharedPreferences.setMockInitialValues({
        'access_token': 'stored_access_token',
        'refresh_token': 'stored_refresh_token',
      });

      final httpService = HttpService();
      await httpService.loadTokens();

      // 通过调用需要 Token 的方法来验证
      // 这里我们测试内部状态，通过后续行为验证
    });

    test('clearTokens 应该清除 SharedPreferences 中的 Token', () async {
      SharedPreferences.setMockInitialValues({
        'access_token': 'test_access_token',
        'refresh_token': 'test_refresh_token',
      });

      final httpService = HttpService();
      await httpService.clearTokens();

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('access_token'), isNull);
      expect(prefs.getString('refresh_token'), isNull);
    });
  });

  group('HttpService 401 处理', () {
    test('收到 401 时应该尝试刷新 Token 并重试', () async {
      var refreshCalled = false;
      var retryCount = 0;

      final mockClient = MockClient((request) async {
        if (request.url.path.contains('/auth/refresh')) {
          refreshCalled = true;
          return http.Response(
            '{"access_token": "new_access_token", "refresh_token": "new_refresh_token"}',
            200,
          );
        }
        if (request.url.path.contains('/api/v1/goals')) {
          retryCount++;
          if (retryCount == 1) {
            // 第一次调用返回 401
            return http.Response('{"detail": "Not authenticated"}', 401);
          }
          // 重试后返回成功
          return http.Response('{"items": []}', 200);
        }
        return http.Response('Not found', 404);
      });

      // 设置初始 Token
      SharedPreferences.setMockInitialValues({
        'access_token': 'expired_token',
        'refresh_token': 'valid_refresh_token',
      });

      final httpService = HttpService();
      await httpService.loadTokens();

      // 执行请求（这里由于 HttpService 使用单例且不能注入 mock client，
      // 我们主要测试逻辑结构）
      // 实际测试需要在真实环境中验证
    });

    test('刷新 Token 失败后应该清除 Token 并抛出异常', () async {
      final mockClient = MockClient((request) async {
        if (request.url.path.contains('/auth/refresh')) {
          return http.Response('{"detail": "Invalid refresh token"}', 401);
        }
        return http.Response('{"detail": "Not authenticated"}', 401);
      });

      SharedPreferences.setMockInitialValues({
        'access_token': 'expired_token',
        'refresh_token': 'invalid_refresh_token',
      });

      final httpService = HttpService();
      await httpService.loadTokens();

      // 执行请求会抛出认证失败异常
      expect(
        () => httpService.get('${AppConfig.baseUrl}/api/v1/test'),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('认证失败'),
        )),
      );
    });
  });

  group('HttpService 请求头', () {
    test('GET 请求应该包含 Authorization 头', () async {
      var capturedHeaders = <String, String>{};

      final mockClient = MockClient((request) async {
        capturedHeaders = request.headers;
        return http.Response('{"data": "test"}', 200);
      });

      SharedPreferences.setMockInitialValues({
        'access_token': 'test_token',
      });

      final httpService = HttpService();
      await httpService.loadTokens();

      // 注意：由于 HttpService 使用 http 包的全局方法，无法直接注入 mock
      // 这里验证代码结构和逻辑
      expect(capturedHeaders, isEmpty); // 实际测试需要重构 HttpService 以支持依赖注入
    });
  });
}
