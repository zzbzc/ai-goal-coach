/// 目标服务
import '../config/constants.dart';
import 'http_service.dart';

class GoalService {
  final HttpService _http = HttpService();

  /// 获取目标列表
  Future<List<dynamic>> getGoals({String? status}) async {
    String url = AppConfig.goalsUrl;
    if (status != null) {
      url += '?status=$status';
    }
    final data = await _http.get(url);
    return data['items'] ?? [];
  }

  /// 创建目标
  Future<Map<String, dynamic>> createGoal({
    required String title,
    String? description,
    String icon = '🎯',
    required DateTime startDate,
    required DateTime endDate,
    required String dailyTimeAvailable,
    required String experienceLevel,
  }) async {
    return await _http.post(AppConfig.goalsUrl, {
      'title': title,
      'description': description,
      'icon': icon,
      'start_date': startDate.toIso8601String().split('T')[0],
      'end_date': endDate.toIso8601String().split('T')[0],
      'daily_time_available': dailyTimeAvailable,
      'experience_level': experienceLevel,
    });
  }

  /// 获取目标详情
  Future<Map<String, dynamic>> getGoal(String goalId) async {
    return await _http.get('${AppConfig.goalsUrl}/$goalId');
  }

  /// 更新目标
  Future<Map<String, dynamic>> updateGoal(
    String goalId,
    Map<String, dynamic> updates,
  ) async {
    return await _http.put('${AppConfig.goalsUrl}/$goalId', updates);
  }

  /// 删除目标
  Future<void> deleteGoal(String goalId) async {
    await _http.delete('${AppConfig.goalsUrl}/$goalId');
  }

  /// 获取目标的每日任务
  Future<List<dynamic>> getGoalTasks(String goalId) async {
    return await _http.get('${AppConfig.goalsUrl}/$goalId/tasks');
  }
}
