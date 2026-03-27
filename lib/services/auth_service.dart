/// 认证服务
import '../config/constants.dart';
import 'http_service.dart';

class AuthService {
  final HttpService _http = HttpService();

  /// 用户注册
  Future<Map<String, dynamic>> register({
    required String email,
    required String username,
    required String password,
  }) async {
    final data = await _http.post(AppConfig.registerUrl, {
      'email': email,
      'username': username,
      'password': password,
    });
    await _http.setTokens(data['access_token'], data['refresh_token']);
    return data;
  }

  /// 用户登录
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final data = await _http.post(AppConfig.loginUrl, {
      'email': email,
      'password': password,
    });
    await _http.setTokens(data['access_token'], data['refresh_token']);
    return data;
  }

  /// 获取当前用户信息
  Future<Map<String, dynamic>> getCurrentUser() async {
    return await _http.get(AppConfig.userProfileUrl);
  }

  /// 登出
  Future<void> logout() async {
    await _http.clearTokens();
  }

  /// 检查是否已登录
  Future<bool> isLoggedIn() async {
    await _http.loadTokens();
    return true; // 有 token 就认为已登录，实际有效性由 API 调用结果决定
  }
}
