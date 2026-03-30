/// 学习伙伴服务
import '../config/constants.dart';
import 'http_service.dart';

class PartnerService {
  final HttpService _http = HttpService();

  /// 获取学习伙伴列表
  Future<List<dynamic>> getPartners() async {
    final data = await _http.get(AppConfig.partnersUrl);
    return data is List ? data : (data['items'] ?? []);
  }

  /// 发送学习伙伴请求
  Future<void> sendPartnerRequest(String partnerUsername) async {
    await _http.post(
      '${AppConfig.partnersUrl}/request?partner_username=$partnerUsername',
      {},
    );
  }

  /// 获取挑战列表
  Future<List<dynamic>> getChallenges({String? status}) async {
    String url = AppConfig.challengesUrl;
    if (status != null) {
      url += '?status=$status';
    }
    final data = await _http.get(url);
    return data is List ? data : (data['items'] ?? []);
  }

  /// 加入挑战
  Future<void> joinChallenge(String challengeId) async {
    await _http.post('${AppConfig.challengesUrl}/$challengeId/join', {});
  }

  /// 获取挑战参与者列表
  Future<List<dynamic>> getChallengeParticipants(String challengeId) async {
    final data = await _http.get('${AppConfig.challengesUrl}/$challengeId/participants');
    return data is List ? data : (data['items'] ?? []);
  }
}
