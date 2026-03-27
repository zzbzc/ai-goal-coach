/// 应用配置
class AppConfig {
  // 后端 API 地址
  // Android 模拟器用 10.0.2.2，iOS 模拟器用 localhost
  // 真机调试请改为本机局域网 IP，如 http://192.168.1.100:8000
  static const String baseUrl = 'http://10.0.2.2:8000';

  static const String apiPrefix = '/api/v1';

  // API 端点
  static String get registerUrl => '$baseUrl$apiPrefix/auth/register';
  static String get loginUrl => '$baseUrl$apiPrefix/auth/login';
  static String get refreshTokenUrl => '$baseUrl$apiPrefix/auth/refresh';
  static String get userProfileUrl => '$baseUrl$apiPrefix/auth/me';

  static String get goalsUrl => '$baseUrl$apiPrefix/goals';
  static String get checkinsUrl => '$baseUrl$apiPrefix/checkins';
}
