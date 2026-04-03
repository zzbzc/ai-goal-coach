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
    List<Map<String, dynamic>>? tasks, // AI 生成的每日任务
  }) async {
    final Map<String, dynamic> data = {
      'title': title,
      'description': description,
      'icon': icon,
      'start_date': startDate.toIso8601String().split('T')[0],
      'end_date': endDate.toIso8601String().split('T')[0],
      'daily_time_available': dailyTimeAvailable,
      'experience_level': experienceLevel,
    };
    // 如果有任务，添加到请求中
    if (tasks != null && tasks.isNotEmpty) {
      data['tasks'] = tasks.map((task) => {
        'day_number': task['day_number'] is int
            ? task['day_number'] as int
            : int.tryParse(task['day_number'].toString()) ?? 1,
        'title': task['title']?.toString() ?? '',
        'description': task['description']?.toString(),
        'estimated_minutes': task['estimated_minutes'] is int
            ? task['estimated_minutes'] as int
            : (task['estimated_minutes'] != null
                ? int.tryParse(task['estimated_minutes'].toString())
                : null),
      }).toList();
      print('[GoalService] 发送的 tasks 数据：${data['tasks']}');
    }
    print('[GoalService] 发送的创建目标数据：$data');
    return await _http.post(AppConfig.goalsUrl, data);
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

  /// AI 生成目标计划
  Future<Map<String, dynamic>?> generateAIPlan({
    required String title,
    String? description,
    required int durationDays,
    required String dailyTimeAvailable,
    required String experienceLevel,
  }) async {
    final data = await _http.post('${AppConfig.baseUrl}${AppConfig.apiPrefix}/goals/plan/generate', {
      'title': title,
      'description': description,
      'duration_days': durationDays,
      'daily_time_available': dailyTimeAvailable,
      'experience_level': experienceLevel,
    });
    // 检查 success 字段
    if (data['success'] == true && data['plan'] != null) {
      return data['plan'] as Map<String, dynamic>;
    }
    // 返回错误信息
    throw Exception(data['error'] ?? 'AI 计划生成失败');
  }

  /// 获取已完成目标数量
  Future<int> getCompletedGoalsCount() async {
    final data = await _http.get('${AppConfig.goalsUrl}?status=completed');
    return (data['items'] as List?)?.length ?? 0;
  }
}
