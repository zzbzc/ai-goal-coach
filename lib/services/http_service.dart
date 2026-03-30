/// HTTP 服务
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/constants.dart';

class HttpService {
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();

  String? _accessToken;
  String? _refreshToken;
  bool _isRefreshing = false;

  /// 设置 Token
  Future<void> setTokens(String? accessToken, String? refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    if (accessToken != null && refreshToken != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', accessToken);
      await prefs.setString('refresh_token', refreshToken);
    }
  }

  /// 从存储加载 Token
  Future<void> loadTokens() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('access_token');
    _refreshToken = prefs.getString('refresh_token');
  }

  /// 清除 Token
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

  /// 刷新 Token
  Future<bool> _refreshAccessToken() async {
    if (_refreshToken == null || _isRefreshing) return false;
    _isRefreshing = true;
    try {
      final response = await http.post(
        Uri.parse(AppConfig.refreshTokenUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refresh_token': _refreshToken}),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        await setTokens(data['access_token'], data['refresh_token']);
        _isRefreshing = false;
        return true;
      }
    } catch (_) {}
    _isRefreshing = false;
    await clearTokens();
    return false;
  }

  /// GET 请求
  Future<dynamic> get(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: _getHeaders(),
    );
    return _handleResponse(response, 'get', url);
  }

  /// POST 请求
  Future<dynamic> post(String url, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(url),
      headers: _getHeaders(),
      body: jsonEncode(data),
    );
    return _handleResponse(response, 'post', url, data);
  }

  /// PUT 请求
  Future<dynamic> put(String url, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse(url),
      headers: _getHeaders(),
      body: jsonEncode(data),
    );
    return _handleResponse(response, 'put', url, data);
  }

  /// DELETE 请求
  Future<dynamic> delete(String url) async {
    final response = await http.delete(
      Uri.parse(url),
      headers: _getHeaders(),
    );
    return _handleResponse(response, 'delete', url);
  }

  /// 获取请求头
  Map<String, String> _getHeaders() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (_accessToken != null) {
      headers['Authorization'] = 'Bearer $_accessToken';
    }
    return headers;
  }

  /// 处理响应
  Future<dynamic> _handleResponse(
    http.Response response,
    String method,
    String url, [
    Map<String, dynamic>? data,
  ]) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      // Token 过期，尝试刷新
      final refreshed = await _refreshAccessToken();
      if (refreshed) {
        // 重试原请求
        switch (method) {
          case 'get':
            return await get(url);
          case 'post':
            return await post(url, data!);
          case 'put':
            return await put(url, data!);
          case 'delete':
            return await delete(url);
        }
      }
      throw Exception('认证失败，请重新登录');
    } else {
      String message = '请求失败';
      if (response.body.isNotEmpty) {
        try {
          final data = jsonDecode(response.body);
          message = data['detail'] ?? data['message'] ?? message;
        } catch (_) {}
      }
      throw Exception(message);
    }
  }
}
