/// 认证服务
import '../config/constants.dart';
import 'http_service.dart';

class AuthService {
  final HttpService _http = HttpService();

  /// 发送验证码
  Future<void> sendVerificationCode(String email) async {
    await _http.post(AppConfig.sendVerificationCodeUrl, {
      'email': email,
    });
  }

  /// 验证邮箱
  Future<void> verifyEmail(String email, String code) async {
    await _http.post(AppConfig.verifyEmailUrl, {
      'email': email,
      'verification_code': code,
    });
  }

  /// 用户注册
  Future<Map<String, dynamic>> register({
    required String email,
    required String username,
    required String password,
    String? verificationCode,
  }) async {
    final Map<String, dynamic> data = {
      'email': email,
      'username': username,
      'password': password,
    };
    if (verificationCode != null && verificationCode.isNotEmpty) {
      data['verification_code'] = verificationCode;
    }
    final result = await _http.post(AppConfig.registerUrl, data);
    await _http.setTokens(result['access_token'], result['refresh_token']);
    return result;
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
