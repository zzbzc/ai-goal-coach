# AI Goal Coach 前后端联调指南

## 1. 安装依赖

在前端项目目录运行：

```bash
cd ai-goal-coach
flutter pub get
```

## 2. 配置后端地址

编辑 `lib/config/constants.dart`：

```dart
// 根据你的运行环境修改 baseUrl：

// Android 模拟器
static const String baseUrl = 'http://10.0.2.2:8001';

// iOS 模拟器
static const String baseUrl = 'http://localhost:8001';

// 真机调试（改为本机局域网 IP）
static const String baseUrl = 'http://192.168.1.100:8001';
```

## 3. 启动后端

```bash
cd ai-goal-coach-backend
source .venv/bin/activate  # Windows: .venv\Scripts\activate
uvicorn app.main:app --reload --host 0.0.0.0 --port 8001
```

## 4. 运行前端

```bash
cd ai-goal-coach
flutter run
```

## 5. 测试连接

### 方式一：通过应用测试
1. 启动应用后，尝试注册一个新账号
2. 如果注册成功，说明前后端连接正常

### 方式二：直接调用 API 测试
```bash
# 测试后端是否可访问
curl http://localhost:8001/health

# 测试注册
curl -X POST http://localhost:8001/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","username":"testuser","password":"testpass123"}'
```

## 6. 常见问题

### Q: 连接被拒绝/超时
- 检查后端是否启动：访问 http://localhost:8001/docs
- 检查地址配置：Android 模拟器必须用 `10.0.2.2` 而不是 `localhost`
- 检查防火墙设置

### Q: CORS 错误
- 后端 `.env` 文件中配置正确的 CORS 来源：
  ```
  BACKEND_CORS_ORIGINS=["http://localhost:3000","http://10.0.2.2:8001"]
  ```

### Q: 注册时提示"该邮箱已被注册"
- 这是正常的，说明后端数据库在工作
- 换一个邮箱或清空数据库重试

## 7. 目录结构

```
ai-goal-coach/
├── lib/
│   ├── config/
│   │   └── constants.dart    # API 地址配置
│   ├── services/
│   │   ├── http_service.dart # HTTP 客户端
│   │   ├── auth_service.dart # 认证服务
│   │   ├── goal_service.dart # 目标服务
│   │   └── checkin_service.dart # 打卡服务
│   └── main.dart             # 应用入口
```

## 8. API 文档

启动后端后访问：
- Swagger UI: http://localhost:8001/docs
- ReDoc: http://localhost:8001/redoc
