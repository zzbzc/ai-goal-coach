/// 打卡服务
import '../config/constants.dart';
import 'http_service.dart';

class CheckinService {
  final HttpService _http = HttpService();

  /// 创建打卡
  Future<Map<String, dynamic>> createCheckin({
    required String goalId,
    String? notes,
    int? moodRating,
  }) async {
    return await _http.post(AppConfig.checkinsUrl, {
      'goal_id': goalId,
      if (notes != null) 'notes': notes,
      if (moodRating != null) 'mood_rating': moodRating,
    });
  }

  /// 获取打卡记录
  Future<List<dynamic>> getCheckins({String? goalId}) async {
    String url = AppConfig.checkinsUrl;
    if (goalId != null) {
      url += '?goal_id=$goalId';
    }
    final data = await _http.get(url);
    return data['items'] ?? [];
  }

  /// 获取连续打卡天数（用户级别）
  Future<int> getStreak() async {
    String url = '${AppConfig.checkinsUrl}/streak';
    final data = await _http.get(url);
    return data['streak_count'] ?? 0;
  }

  /// 获取总打卡次数（所有目标打卡记录总和）
  Future<int> getTotalCheckins() async {
    String url = '${AppConfig.checkinsUrl}/stats/total-checkins';
    final data = await _http.get(url);
    return data['total_checkins'] ?? 0;
  }
}
