/// 应用配置
class AppConfig {
  // 后端 API 地址
  // 本地开发环境（VSCode 远程/服务器转发）
  static const String baseUrl = 'http://localhost:8001';

  static const String apiPrefix = '/api/v1';

  // API 端点
  static String get registerUrl => '$baseUrl$apiPrefix/auth/register';
  static String get loginUrl => '$baseUrl$apiPrefix/auth/login';
  static String get refreshTokenUrl => '$baseUrl$apiPrefix/auth/refresh';
  static String get userProfileUrl => '$baseUrl$apiPrefix/auth/me';

  static String get goalsUrl => '$baseUrl$apiPrefix/goals';
  static String get checkinsUrl => '$baseUrl$apiPrefix/checkins';
  static String get partnersUrl => '$baseUrl$apiPrefix/partners/partners';
  static String get challengesUrl => '$baseUrl$apiPrefix/partners/challenges';
}
