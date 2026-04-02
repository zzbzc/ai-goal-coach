import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/services.dart';

// ==================== 设计系统颜色常量（来自 DESIGN.md）====================
class AppColors {
  const AppColors._();

  // 主色 - 森林绿
  static const primary = Color(0xFF2D5A46);
  static const primaryContainer = Color(0xFFE8F5EF);
  static const onPrimaryContainer = Color(0xFF0F1F18);
  static const primaryDark = Color(0xFF1F3D30);
  static const primaryLight = Color(0xFF4A7C63);

  // 辅色 - 鼠尾草绿
  static const secondary = Color(0xFF87A892);
  static const secondaryContainer = Color(0xFFD1E8DC);
  static const secondaryLight = Color(0xFFA8C4B0);

  // 点缀色 - 珊瑚红
  static const tertiary = Color(0xFFE07A5F);
  static const tertiaryContainer = Color(0xFFFFF5F3);
  static const onTertiaryContainer = Color(0xFF3D1F18);
  static const tertiaryLight = Color(0xFFFF9B85);

  // 中性色 - 暖灰系
  static const neutral50 = Color(0xFFFAF9F7);    // 主背景
  static const neutral100 = Color(0xFFF2F0EB);   // 次级背景
  static const neutral150 = Color(0xFFEAE6DD);   // 卡片背景
  static const neutral200 = Color(0xFFE6E2D8);   // 边框/分割线
  static const neutral300 = Color(0xFFD4CFC6);   // 弱化边框
  static const neutral400 = Color(0xFFB5ADA0);   // 弱化文字
  static const neutral500 = Color(0xFF998F80);   // 次级文字
  static const neutral600 = Color(0xFF7D7265);   // 次要文字
  static const neutral700 = Color(0xFF5C5247);   // 强调文字
  static const neutral800 = Color(0xFF4A3D32);   // 主要文字
  static const neutral900 = Color(0xFF3D342B);   // 主要文字（深）

  // 语义色
  static const success = Color(0xFF4A7C59);
  static const warning = Color(0xFFD4A373);
  static const error = Color(0xFFC96859);
  static const info = Color(0xFF6B9AC4);

  // 功能色 - 卡片背景/强调背景
  static const cardBackground = Color(0xFFFFFFFF);
  static const cardBackgroundAlt = Color(0xFFF8F6F0);
  static const inputBackground = Color(0xFFFFFFFF);

  // 渐变色定义
  static const gradientPrimary = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const gradientTertiary = LinearGradient(
    colors: [tertiary, Color(0xFFD66A52)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const gradientWarm = LinearGradient(
    colors: [Color(0xFFFFF5F3), Color(0xFFFFE8E0)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// 阴影定义
class AppShadows {
  const AppShadows._();

  static List<BoxShadow> get sm => [
    BoxShadow(color: Color(0xFF0F1F18).withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2)),
  ];

  static List<BoxShadow> get md => [
    BoxShadow(color: Color(0xFF0F1F18).withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4)),
    BoxShadow(color: Color(0xFF0F1F18).withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2)),
  ];

  static List<BoxShadow> get lg => [
    BoxShadow(color: Color(0xFF0F1F18).withOpacity(0.1), blurRadius: 24, offset: const Offset(0, 8)),
    BoxShadow(color: Color(0xFF0F1F18).withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 4)),
  ];

  static List<BoxShadow> get coloredPrimary => [
    BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 6)),
  ];

  static List<BoxShadow> get coloredTertiary => [
    BoxShadow(color: AppColors.tertiary.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 6)),
  ];
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化 HTTP 服务（加载存储的 Token）
  await HttpService().loadTokens();
  runApp(const AIGoalCoachApp());
}

class AIGoalCoachApp extends StatelessWidget {
  const AIGoalCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI 目标教练',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 自然亲和配色系统 - 森林绿 + 暖灰 + 珊瑚红
        brightness: Brightness.light,
        // 主色：森林绿
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: AppColors.primaryContainer,
          onPrimaryContainer: AppColors.onPrimaryContainer,
          secondary: AppColors.secondary,
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: AppColors.secondaryContainer,
          onSecondaryContainer: AppColors.primaryDark,
          tertiary: AppColors.tertiary,
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: AppColors.tertiaryContainer,
          onTertiaryContainer: AppColors.onTertiaryContainer,
          error: AppColors.error,
          onError: Color(0xFFFFFFFF),
          surface: AppColors.inputBackground,
          onSurface: AppColors.neutral900,
          outline: AppColors.neutral200,
        ),
        // 背景色：暖灰系
        scaffoldBackgroundColor: AppColors.neutral50,
        // 字体配置 - 根据 DESIGN.md
        textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
          bodyLarge: GoogleFonts.dmSans(fontSize: 16, color: AppColors.neutral900),
          bodyMedium: GoogleFonts.dmSans(fontSize: 14, color: AppColors.neutral600),
          headlineLarge: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.neutral900),
          headlineMedium: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.neutral900),
          titleMedium: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.neutral900),
          labelSmall: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.neutral600),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.neutral50,
          foregroundColor: AppColors.neutral900,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral900,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shadowColor: AppColors.primary.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: const Color(0xFFFFFFFF),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.inputBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.neutral200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.neutral200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

// ==================== 启动页 ====================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late AnimationController _particleController;
  late AnimationController _logoController;
  late Animation<double> _logoFadeIn;
  late Animation<double> _logoScale;
  late Animation<double> _titleFadeIn;
  late Animation<double> _titleSlideUp;
  late Animation<double> _taglineFadeIn;
  late Animation<double> _particleAnimation;
  late Animation<Color?> _gradientAnimation;

  // 粒子系统
  final List<_Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initParticles();

    // 渐变动画：从深夜到破晓
    _gradientController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _gradientAnimation = ColorTween(
      begin: const Color(0xFF1A3A2E),
      end: const Color(0xFF2D5A46),
    ).animate(CurvedAnimation(
      parent: _gradientController,
      curve: Curves.easeInOut,
    ));

    // Logo 动画
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _logoFadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: const Interval(0.0, 0.5, curve: Curves.easeOut)),
    );
    _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: const Interval(0.0, 0.5, curve: Curves.elasticOut)),
    );

    // 标题动画
    _titleFadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: const Interval(0.3, 0.7, curve: Curves.easeOut)),
    );
    _titleSlideUp = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(parent: _logoController, curve: const Interval(0.3, 0.7, curve: Curves.easeOutCubic)),
    );

    // 标语动画
    _taglineFadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: const Interval(0.6, 1.0, curve: Curves.easeOut)),
    );

    // 粒子动画
    _particleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    _particleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _particleController, curve: Curves.easeInOut),
    );

    _logoController.forward();
    _gradientController.forward();

    // 3 秒后进入引导页
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  void _initParticles() {
    for (int i = 0; i < 20; i++) {
      _particles.add(_Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 3 + 1,
        speedX: (_random.nextDouble() - 0.5) * 0.02,
        speedY: (_random.nextDouble() - 0.5) * 0.02,
        opacity: _random.nextDouble() * 0.5 + 0.1,
      ));
    }
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _particleController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([_gradientController, _logoController, _particleController]),
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(_gradientAnimation.value!, AppColors.primary, 0.3)!,
                  Color.lerp(const Color(0xFF0D241C), AppColors.primaryDark, 0.5)!,
                ],
              ),
            ),
            child: Stack(
              children: [
                // 粒子层
                CustomPaint(
                  painter: _ParticlePainter(
                    particles: _particles,
                    animationValue: _particleAnimation.value,
                  ),
                  size: Size.infinite,
                ),
                // 装饰性光晕
                Positioned(
                  top: -100,
                  right: -100,
                  child: Transform.rotate(
                    angle: _particleAnimation.value * 0.1,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.secondary.withOpacity(0.15 * _particleAnimation.value),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -80,
                  left: -80,
                  child: Transform.rotate(
                    angle: -_particleAnimation.value * 0.15,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.tertiary.withOpacity(0.1 * _particleAnimation.value),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // 主内容
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      FadeTransition(
                        opacity: _logoFadeIn,
                        child: ScaleTransition(
                          scale: _logoScale,
                          child: Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.25),
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.auto_graph_rounded,
                              size: 70,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // 标题
                      Transform.translate(
                        offset: Offset(0, _titleSlideUp.value),
                        child: FadeTransition(
                          opacity: _titleFadeIn,
                          child: const Text(
                            'AI 目标教练',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(
                                  color: Color(0x40000000),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // 副标题
                      FadeTransition(
                        opacity: _titleFadeIn,
                        child: Text(
                          'AI Goal Coach',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.7),
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // 标语
                      FadeTransition(
                        opacity: _taglineFadeIn,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.tertiary.withOpacity(0.3),
                                AppColors.secondary.withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.rocket_launch_rounded,
                                color: Colors.white.withOpacity(0.9),
                                size: 18,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '把"我想"变成"我做到"',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 底部光效
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 120,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.primary.withOpacity(0.4),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 粒子数据类
class _Particle {
  final double x;
  final double y;
  final double size;
  final double speedX;
  final double speedY;
  final double opacity;

  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.opacity,
  });
}

// 粒子绘制器
class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double animationValue;

  _ParticlePainter({required this.particles, required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(particle.opacity * (0.5 + animationValue * 0.5))
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, particle.size * 0.5);

      final x = (particle.x + particle.speedX * animationValue * 20) * size.width;
      final y = (particle.y + particle.speedY * animationValue * 20) * size.height;

      canvas.drawCircle(Offset(x, y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}

// ==================== 登录界面 ====================
// 设计概念："黎明森林" — 晨光穿透森林的静谧感
// 非对称布局 + 玻璃态卡片 + 阶梯式动效
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  final AuthService _authService = AuthService();

  // 动效控制器
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: const Interval(0.0, 0.6, curve: Curves.easeOut)),
    );

    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic)),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await _authService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLargeScreen = screenSize.height > 700;

    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: screenSize.height,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
              Color(0xFF0D1F18),
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // 背景装饰 - 微妙的光晕
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.secondary.withOpacity(0.15),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -150,
              left: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.tertiary.withOpacity(0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // 主内容
            SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: screenSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primary,
                        AppColors.primaryDark,
                        Color(0xFF0D1F18),
                      ],
                      stops: [0.0, 0.6, 1.0],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width > 400 ? 40 : 24,
                      vertical: isLargeScreen ? 60 : 40,
                    ),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.15),
                          end: Offset.zero,
                        ).animate(_slideAnimation),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          // Logo 区域
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.auto_awesome_rounded,
                              size: 36,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: isLargeScreen ? 48 : 32),
                          // 标题
                          const Text(
                            '欢迎回来',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '登录以继续你的目标之旅',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.7),
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: isLargeScreen ? 56 : 40),
                          // 登录表单卡片 - 玻璃态效果
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.95),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 40,
                                      offset: const Offset(0, 20),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(28),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        // 邮箱输入
                                        _buildTextField(
                                          controller: _emailController,
                                          label: '邮箱',
                                          hint: 'your@email.com',
                                          icon: Icons.email_outlined,
                                          keyboardType: TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return '请输入邮箱';
                                            }
                                            if (!value.contains('@')) {
                                              return '请输入有效的邮箱地址';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        // 密码输入
                                        _buildPasswordField(
                                          controller: _passwordController,
                                          label: '密码',
                                          hint: '至少 6 位',
                                          obscureText: _obscurePassword,
                                          onToggleVisibility: () {
                                            setState(() => _obscurePassword = !_obscurePassword);
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return '请输入密码';
                                            }
                                            if (value.length < 6) {
                                              return '密码至少 6 位';
                                            }
                                            return null;
                                          },
                                        ),
                                        // 错误提示
                                        if (_errorMessage != null) ...[
                                          const SizedBox(height: 20),
                                          Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              color: AppColors.error.withOpacity(0.08),
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(
                                                color: AppColors.error.withOpacity(0.2),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.info_outline,
                                                  color: AppColors.error,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    _errorMessage!,
                                                    style: const TextStyle(
                                                      color: AppColors.error,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                        const SizedBox(height: 28),
                                        // 登录按钮
                                        SizedBox(
                                          height: 56,
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 200),
                                            decoration: BoxDecoration(
                                              gradient: _isLoading ? null : const LinearGradient(
                                                colors: [AppColors.tertiary, Color(0xFFD66A52)],
                                              ),
                                              borderRadius: BorderRadius.circular(14),
                                              boxShadow: _isLoading ? null : [
                                                BoxShadow(
                                                  color: AppColors.tertiary.withOpacity(0.4),
                                                  blurRadius: 20,
                                                  offset: const Offset(0, 8),
                                                ),
                                              ],
                                            ),
                                            child: ElevatedButton(
                                              onPressed: _isLoading ? null : _handleLogin,
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(14),
                                                ),
                                              ),
                                              child: _isLoading
                                                  ? const SizedBox(
                                                      height: 24,
                                                      width: 24,
                                                      child: CircularProgressIndicator(
                                                        strokeWidth: 2.5,
                                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                      ),
                                                    )
                                                  : const Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          '登录',
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            letterSpacing: 0.3,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.arrow_forward_rounded, size: 20),
                                                      ],
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // 注册提示
                          Center(
                            child: TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('注册功能暂未开放，请联系管理员创建账号'),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                              child: RichText(
                                text: const TextSpan(
                                  text: '还没有账号？',
                                  style: TextStyle(fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: '注册',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // 底部填充 - 避免内容贴底
                          SizedBox(height: isLargeScreen ? 80 : 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ),
            // 底部光效填充
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFF0D1F18).withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral700,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.neutral900,
            height: 1.5,
          ),
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.neutral400,
              fontSize: 15,
            ),
            prefixIcon: Container(
              margin: const EdgeInsets.only(right: 8),
              width: 40,
              child: Icon(icon, color: AppColors.neutral500),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.neutral300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.neutral300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral700,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.neutral900,
            height: 1.5,
          ),
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.neutral400,
              fontSize: 15,
            ),
            prefixIcon: Container(
              margin: const EdgeInsets.only(right: 8),
              width: 40,
              child: const Icon(Icons.lock_outlined, color: AppColors.neutral500),
            ),
            suffixIcon: GestureDetector(
              onTap: onToggleVisibility,
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 8),
                child: Icon(
                  obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: AppColors.neutral500,
                  size: 20,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.neutral300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.neutral300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }
}

// ==================== 新手引导页 ====================
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _pulseController;
  late AnimationController _floatController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _floatAnimation;

  // 每页的独特配色和图标
  final List<_OnboardingPageData> _pageData = [
    _OnboardingPageData(
      icon: Icons.lightbulb_outline_rounded,
      secondaryIcon: Icons.auto_awesome,
      title: '告诉我你想做什么',
      subtitle: '每一个大目标，都值得被认真对待',
      description: '不管是读书、运动、还是学习新技能\n告诉我你的想法，AI 帮你梳理清晰',
      gradientStart: const Color(0xFF1A4D3E),
      gradientEnd: const Color(0xFF0D2F24),
      accentColor: const Color(0xFFFFD54F),
      blobColor: const Color(0x20FFD54F),
    ),
    _OnboardingPageData(
      icon: Icons.auto_graph_rounded,
      secondaryIcon: Icons.timeline_outlined,
      title: 'AI 帮你拆成每天任务',
      subtitle: '再远的目标，也能一步步到达',
      description: 'AI 会把大目标拆成每天可做的小任务\n让你不再迷茫，知道今天该做什么',
      gradientStart: const Color(0xFF2D5A46),
      gradientEnd: const Color(0xFF1A3A2E),
      accentColor: const Color(0xFF81C784),
      blobColor: const Color(0x2081C784),
    ),
    _OnboardingPageData(
      icon: Icons.celebration_outlined,
      secondaryIcon: Icons.local_fire_department_rounded,
      title: '每天打卡，看着自己进步',
      subtitle: '坚持的力量，超乎你的想象',
      description: '每完成一天都是胜利\n看着连续打卡天数增长，感受积累的力量',
      gradientStart: const Color(0xFF3D6B52),
      gradientEnd: const Color(0xFF2D4A3A),
      accentColor: const Color(0xFFE07A5F),
      blobColor: const Color(0x20E07A5F),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _floatController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);
    _floatAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([_pulseController, _floatController]),
        builder: (context, child) {
          final currentPageData = _pageData[_currentPage];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  currentPageData.gradientStart,
                  currentPageData.gradientEnd,
                ],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: _pageData.length,
                    itemBuilder: (context, index) {
                      final data = _pageData[index];
                      final isCurrentPage = index == _currentPage;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                        child: Column(
                          children: [
                            const Spacer(flex: 1),
                            // 主图标区域
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // 光晕背景
                                ScaleTransition(
                                  scale: _pulseAnimation,
                                  child: Container(
                                    width: 220,
                                    height: 220,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          data.accentColor.withOpacity(0.2),
                                          data.accentColor.withOpacity(0.05),
                                          Colors.transparent,
                                        ],
                                        stops: const [0.3, 0.6, 1.0],
                                      ),
                                    ),
                                  ),
                                ),
                                // 装饰性圆环
                                Transform.rotate(
                                  angle: _floatAnimation.value * 0.3 - 0.15,
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: data.accentColor.withOpacity(0.3),
                                        width: 1.5,
                                        strokeAlign: BorderSide.strokeAlignInside,
                                      ),
                                    ),
                                  ),
                                ),
                                // 主图标容器
                                Transform.translate(
                                  offset: Offset(0, -_floatAnimation.value * 10 + 5),
                                  child: Container(
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.25),
                                          Colors.white.withOpacity(0.1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.3),
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: data.accentColor.withOpacity(0.3),
                                          blurRadius: 40,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      data.icon,
                                      size: 75,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                // 浮动小图标
                                Positioned(
                                  top: 20,
                                  right: 30,
                                  child: Transform.translate(
                                    offset: Offset(_floatAnimation.value * 5, -_floatAnimation.value * 5),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: data.accentColor.withOpacity(0.3),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.5),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Icon(
                                        data.secondaryIcon,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 1),
                            // 副标题
                            Opacity(
                              opacity: isCurrentPage ? 1.0 : 0.7,
                              child: Text(
                                data.subtitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.8),
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // 主标题
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                data.title,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  height: 1.3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 20),
                            // 描述卡片
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(horizontal: 16),
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: data.description.split('\n').map((line) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4),
                                        child: Text(
                                          line,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white.withOpacity(0.9),
                                            height: 1.6,
                                            letterSpacing: 0.3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                      );
                    },
                  ),
                  // 顶部控制区
                  Positioned(
                    top: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 44),
                        // 页面指示器
                        Row(
                          children: List.generate(
                            _pageData.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: _currentPage == index ? 24 : 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? _pageData[_currentPage].accentColor
                                    : Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        // 跳过按钮
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                          child: const Text(
                            '跳过',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 底部按钮区
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 32,
                    child: Column(
                      children: [
                        // 进度条
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: (_currentPage + 1) / _pageData.length,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              _pageData[_currentPage].accentColor,
                            ),
                            minHeight: 4,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // 主按钮
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_currentPage < _pageData.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOutCubic,
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) =>
                                        const LoginScreen(),
                                    transitionsBuilder:
                                        (context, animation, secondaryAnimation, child) {
                                      return FadeTransition(opacity: animation, child: child);
                                    },
                                    transitionDuration: const Duration(milliseconds: 600),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _pageData[_currentPage].accentColor,
                              foregroundColor: Colors.white,
                              elevation: 12,
                              shadowColor: Colors.black.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _currentPage < _pageData.length - 1
                                      ? '下一步'
                                      : '开始设定目标',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  _currentPage < _pageData.length - 1
                                      ? Icons.arrow_forward_rounded
                                      : Icons.check_rounded,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// 新手引导页数据结构
class _OnboardingPageData {
  final IconData icon;
  final IconData secondaryIcon;
  final String title;
  final String subtitle;
  final String description;
  final Color gradientStart;
  final Color gradientEnd;
  final Color accentColor;
  final Color blobColor;

  _OnboardingPageData({
    required this.icon,
    required this.secondaryIcon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.gradientStart,
    required this.gradientEnd,
    required this.accentColor,
    required this.blobColor,
  });
}

// ==================== 主屏幕 ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const GoalsListScreen(),
    const CheckinScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.white,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.1),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: AppColors.primary),
            label: '首页',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            selectedIcon: Icon(Icons.check_circle, color: AppColors.primary),
            label: '打卡',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: AppColors.primary),
            label: '我的',
          ),
        ],
      ),
    );
  }
}

// ==================== 目标列表屏幕 ====================
class GoalsListScreen extends StatefulWidget {
  const GoalsListScreen({super.key});

  @override
  State<GoalsListScreen> createState() => _GoalsListScreenState();
}

class _GoalsListScreenState extends State<GoalsListScreen> {
  bool _hasGoals = false;
  bool _isLoading = true;
  List<dynamic> _goals = [];
  String? _errorMessage;
  final GoalService _goalService = GoalService();

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    setState(() => _isLoading = true);
    try {
      final goals = await _goalService.getGoals();
      debugPrint('【加载目标】goals 数量：${goals.length}');
      for (var goal in goals) {
        debugPrint('  - 目标：${goal['title']}, today_task: ${goal['today_task']}, current_day: ${goal['current_day']}, duration_days: ${goal['duration_days']}');
      }
      setState(() {
        _goals = goals;
        _hasGoals = goals.isNotEmpty;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '我的目标',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF2D5A46),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateGoalScreen()),
              ).then((value) {
                if (value == true) {
                  _loadGoals(); // 刷新目标列表
                }
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? _buildErrorState()
              : _hasGoals
                  ? _buildGoalsList()
                  : _buildEmptyState(),
    );
  }

  Widget _buildErrorState() {
    // 检测是否为未登录错误
    final isNotLoggedIn = _errorMessage!.contains('请先登录');

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: isNotLoggedIn ? AppColors.info.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(80),
              ),
              child: Icon(
                isNotLoggedIn ? Icons.login_outlined : Icons.error_outline,
                size: 80,
                color: isNotLoggedIn ? AppColors.info : AppColors.error,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              isNotLoggedIn ? '请先登录' : '加载失败',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.neutral900,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              isNotLoggedIn ? '登录后才能查看和管理目标' : (_errorMessage ?? '未知错误'),
              style: TextStyle(
                fontSize: 16,
                color: AppColors.neutral500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 220,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: 跳转到登录页面
                  // 暂时返回首页
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                },
                icon: const Icon(Icons.login),
                label: Text(
                  isNotLoggedIn ? '去登录' : '重试',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(80),
              ),
              child: const Icon(
                Icons.my_location_outlined,
                size: 80,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              '还没有目标',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.neutral900,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '创建一个目标开始吧',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.neutral500,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 220,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateGoalScreen()),
                  ).then((value) {
                    if (value == true) {
                      setState(() => _hasGoals = true);
                    }
                  });
                },
                icon: const Icon(Icons.add, size: 24),
                label: const Text(
                  '创建目标',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmDialog(BuildContext context, String goalId, String goalTitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('删除目标', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text('确定要删除「$goalTitle」吗？删除后无法恢复。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final goalService = GoalService();
                await goalService.deleteGoal(goalId);
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('删除成功')),
                  );
                  _loadGoals(); // 刷新列表
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('删除失败：$e')),
                  );
                }
              }
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalsList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '进行中目标 (${_goals.length})',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 16),
          ..._goals.map((goal) => _buildGoalCardFromData(goal)),
          const SizedBox(height: 24),
          Card(
            color: AppColors.cardBackground,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, color: Colors.amber[700]),
                      const SizedBox(width: 8),
                      Text(
                        '快捷操作',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.neutral800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateGoalScreen()),
                        ).then((value) {
                          if (value == true) setState(() {});
                        });
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('创建新目标'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CommunityScreen()),
                        );
                      },
                      icon: const Icon(Icons.people_outline),
                      label: const Text('查看学习伙伴'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.neutral200),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 从后端数据构建目标卡片
  Widget _buildGoalCardFromData(dynamic goal) {
    final int totalDays = (goal['duration_days'] ?? 30);
    final int currentDay = (goal['current_day'] ?? 0);
    final double progress = totalDays > 0 ? currentDay / totalDays : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.neutral200.withOpacity(0.6), width: 1),
        boxShadow: AppShadows.md,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GoalDetailScreen(goalId: goal['id']),
            ),
          ).then((value) {
            if (value == true) _loadGoals();
          });
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primaryContainer, AppColors.primary.withOpacity(0.15)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 1),
                    ),
                    child: const Icon(Icons.menu_book_rounded, color: AppColors.primary, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          goal['title'] ?? '未命名目标',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColors.neutral900,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '第 $currentDay / $totalDays 天',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryDark,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) async {
                      if (value == 'delete') {
                        _showDeleteConfirmDialog(context, goal['id'], goal['title']);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.error.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(Icons.close_rounded, color: AppColors.error, size: 16),
                            ),
                            const SizedBox(width: 10),
                            const Text('删除目标', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // 渐变进度条
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.neutral150,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FractionallySizedBox(
                    widthFactor: progress,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.primaryLight],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded, size: 14, color: AppColors.neutral500),
                      const SizedBox(width: 6),
                      Text(
                        '第$currentDay 天 / 共$totalDays 天',
                        style: TextStyle(fontSize: 12, color: AppColors.neutral600, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: progress > 0.5 ? AppColors.primaryContainer : AppColors.neutral150,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: progress > 0.5 ? AppColors.primaryDark : AppColors.neutral600,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // 今日任务卡片
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.tertiaryContainer, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.tertiary.withOpacity(0.15), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.tertiary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.today_rounded, size: 18, color: AppColors.tertiary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '今天',
                            style: TextStyle(fontSize: 11, color: AppColors.neutral500, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            goal['today_task'] ?? '暂无任务',
                            style: const TextStyle(fontSize: 14, color: AppColors.neutral800, fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // 打卡按钮
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoalDetailScreen(goalId: goal['id']),
                      ),
                    ).then((value) {
                      if (value == true) _loadGoals();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_rounded, size: 20),
                      SizedBox(width: 8),
                      Text(
                        '去打卡',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -0.2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== 创建目标屏幕 ====================
class CreateGoalScreen extends StatefulWidget {
  const CreateGoalScreen({super.key});

  @override
  State<CreateGoalScreen> createState() => _CreateGoalScreenState();
}

class _CreateGoalScreenState extends State<CreateGoalScreen> {
  int _step = 1;
  final TextEditingController _goalController = TextEditingController();
  String _selectedTime = '1 小时';
  String _customTime = ''; // 自定义时间值
  String _selectedLevel = '零基础';
  int _selectedDurationDays = 30;
  int? _customDurationDays; // 自定义持续天数
  final GoalService _goalService = GoalService();
  bool _isCreating = false;
  int _createStep = 0; // 0=未开始，1=生成 AI 计划中，2=创建目标中，3=完成
  String _createMessage = '';

  final List<Map<String, String>> _templates = [
    {'icon': '📚', 'title': '30 天读 5 本书', 'goal': '30 天读 5 本书'},
    {'icon': '🧘', 'title': '每天冥想 10 分钟', 'goal': '每天冥想 10 分钟，坚持 21 天'},
    {'icon': '⏰', 'title': '30 天早起挑战', 'goal': '30 天早起挑战，每天 6 点起床'},
    {'icon': '🏃', 'title': '每周运动 3 次', 'goal': '每周运动 3 次，坚持 60 天'},
  ];

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建目标'),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF2D5A46),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _step == 1 ? _buildStep1() : _buildStep2(),
    );
  }

  Widget _buildStep1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '你想达成什么目标？',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.neutral900),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _goalController,
            decoration: InputDecoration(
              hintText: '请输入你的目标...',
              hintStyle: TextStyle(color: AppColors.neutral400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 32),
          Text(
            '或者选择一个模板：',
            style: TextStyle(fontSize: 14, color: AppColors.neutral600),
          ),
          const SizedBox(height: 16),
          ..._templates.map((template) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                _goalController.text = template['goal']!;
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.neutral200),
                ),
                child: Row(
                  children: [
                    Text(template['icon']!, style: const TextStyle(fontSize: 28)),
                    const SizedBox(width: 16),
                    Text(
                      template['title']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.neutral700),
                    ),
                    const Spacer(),
                    Icon(Icons.chevron_right, color: AppColors.neutral400),
                  ],
                ),
              ),
            ),
          )),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () => setState(() => _step = 2),
              child: const Text('下一步', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '你的基础情况：',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.neutral900),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('每天可用时间：'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ...['30 分钟', '1 小时', '2 小时', '灵活'].map((time) {
                final isSelected = _selectedTime == time;
                return ChoiceChip(
                  label: Text(time),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) setState(() => _selectedTime = time);
                  },
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.neutral900,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              }),
              // 自定义选项
              ChoiceChip(
                label: Text(_customTime.isNotEmpty ? _customTime : '自定义'),
                selected: _selectedTime == 'custom',
                onSelected: (selected) {
                  if (selected) _showCustomTimeDialog();
                },
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: _selectedTime == 'custom' ? Colors.white : AppColors.neutral900,
                  fontWeight: _selectedTime == 'custom' ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ].toList(),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('你的经验水平：'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: ['零基础', '有一些基础', '中级', '高级'].map((level) {
              final isSelected = _selectedLevel == level;
              return ChoiceChip(
                label: Text(level),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) setState(() => _selectedLevel = level);
                },
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppColors.neutral900,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('目标持续时间：'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ...[7, 14, 30, 60, 90].map((days) {
                final label = '$days 天';
                final isSelected = _selectedDurationDays == days && _customDurationDays == null;
                return ChoiceChip(
                  label: Text(label),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedDurationDays = days;
                        _customDurationDays = null;
                      });
                    }
                  },
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.neutral900,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              }),
              // 自定义选项
              ChoiceChip(
                label: Text(_customDurationDays != null ? '$_customDurationDays 天' : '自定义'),
                selected: _customDurationDays != null,
                onSelected: (selected) {
                  if (selected) _showCustomDurationDialog();
                },
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: _customDurationDays != null ? Colors.white : AppColors.neutral900,
                  fontWeight: _customDurationDays != null ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ].toList(),
          ),
          const SizedBox(height: 40),
          // 分阶段进度指示器
          if (_isCreating) ...[
            Row(
              children: [
                _buildStepIndicator(1, '生成 AI 计划'),
                const Expanded(child: SizedBox(height: 2)),
                _buildStepIndicator(2, '创建目标'),
                const Expanded(child: SizedBox(height: 2)),
                _buildStepIndicator(3, '完成'),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _createMessage,
                      style: TextStyle(fontSize: 14, color: AppColors.primaryDark, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ] else
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _createGoal,
                icon: const Icon(Icons.auto_awesome),
                label: const Text('生成计划', style: TextStyle(fontSize: 18)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 14, color: AppColors.neutral600),
    );
  }

  Widget _buildStepIndicator(int stepNum, String label) {
    final isCompleted = _createStep >= stepNum;
    final isCurrent = _createStep == stepNum;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isCompleted ? AppColors.primary : (isCurrent ? AppColors.primaryContainer : AppColors.neutral150),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isCompleted || isCurrent ? AppColors.primary : AppColors.neutral300,
              width: 2,
            ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, size: 18, color: Colors.white)
                : Text(
                    '$stepNum',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isCompleted || isCurrent ? AppColors.primary : AppColors.neutral500,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
            color: isCurrent ? AppColors.primaryDark : AppColors.neutral600,
          ),
        ),
      ],
    );
  }

  // 显示自定义时间对话框
  void _showCustomTimeDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('输入每天可用时间'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '如：45 分钟、1.5 小时、3 小时',
          ),
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              setState(() {
                _customTime = value.trim();
                _selectedTime = value.trim();
              });
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                setState(() {
                  _customTime = controller.text.trim();
                  _selectedTime = controller.text.trim();
                });
                Navigator.pop(context);
              }
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  // 显示自定义持续时间对话框
  void _showCustomDurationDialog() {
    final controller = TextEditingController(text: _customDurationDays?.toString() ?? '');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('输入目标持续天数'),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: '如：21、45、120',
          ),
          onSubmitted: (value) {
            final days = int.tryParse(value.trim());
            if (days != null && days > 0) {
              setState(() {
                _customDurationDays = days;
                _selectedDurationDays = days;
              });
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              final days = int.tryParse(controller.text.trim());
              if (days != null && days > 0) {
                setState(() {
                  _customDurationDays = days;
                  _selectedDurationDays = days;
                });
                Navigator.pop(context);
              }
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  Future<void> _createGoal() async {
    setState(() {
      _isCreating = true;
      _createStep = 1;
      _createMessage = '正在生成 AI 计划，预计需要 5-10 秒...';
    });
    try {
      // 1. 先调用 AI 生成计划
      Map<String, dynamic>? aiPlan;
      try {
        aiPlan = await _goalService.generateAIPlan(
          title: _goalController.text,
          description: null,
          durationDays: _selectedDurationDays,
          dailyTimeAvailable: _selectedTime,
          experienceLevel: _selectedLevel,
        );
        debugPrint('AI 计划生成成功！');
        debugPrint('  - 包含的键：${aiPlan?.keys.join(', ')}');
        debugPrint('  - daily_tasks 数量：${(aiPlan?['daily_tasks'] as List?)?.length ?? 0}');
        debugPrint('  - weekly_plans 数量：${(aiPlan?['weekly_plans'] as List?)?.length ?? 0}');
      } catch (e) {
        // AI 生成失败，继续创建目标但不显示计划
        debugPrint('AI 计划生成失败：$e');
        aiPlan = null;
      }

      // 进入下一步：创建目标
      setState(() {
        _createStep = 2;
        _createMessage = '正在创建目标，同步 AI 生成的任务...';
      });

      // 2. 创建目标（带上 AI 生成的任务）
      final startDate = DateTime.now();
      final endDate = startDate.add(Duration(days: _selectedDurationDays));

      // 提取 AI 生成的 daily_tasks
      List<Map<String, dynamic>>? dailyTasks;
      if (aiPlan != null && aiPlan['daily_tasks'] != null) {
        dailyTasks = (aiPlan['daily_tasks'] as List).map((task) => {
          'day_number': task['day_number'] as int,
          'title': task['title'] as String,
          'description': task['description'] as String?,
          'estimated_minutes': task['estimated_minutes'] as int?,
        }).toList();
        debugPrint('【创建目标】daily_tasks 数量：${dailyTasks.length}');
        if (dailyTasks.isNotEmpty) {
          debugPrint('【创建目标】第 1 天任务：${dailyTasks[0]['title']}');
        }
      }

      final result = await _goalService.createGoal(
        title: _goalController.text,
        description: '通过 AI 辅助达成目标',
        icon: '🎯',
        startDate: startDate,
        endDate: endDate,
        dailyTimeAvailable: _selectedTime,
        experienceLevel: _selectedLevel,
        tasks: dailyTasks, // 传递 AI 生成的任务
      );

      debugPrint('【创建目标】后端返回：today_task=${result['today_task']}, current_day=${result['current_day']}');

      // 进入完成步骤
      setState(() {
        _createStep = 3;
        _createMessage = '目标创建完成！';
      });

      // 3. 展示 AI 生成的计划（如果有），用户关闭对话框后再关闭页面
      if (aiPlan != null && (aiPlan.containsKey('daily_tasks') || aiPlan.containsKey('weekly_plans'))) {
        _showAIPlanDialog(aiPlan);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('目标创建成功！')),
          );
        }
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isCreating = false;
          _createStep = 0;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_getFriendlyErrorMessage(e.toString()))),
        );
      }
    }
  }

  // 展示 AI 计划对话框
  void _showAIPlanDialog(Map<String, dynamic> plan) {
    debugPrint('【AI 计划对话框】开始展示');
    debugPrint('  - 传入的 plan 键：${plan.keys.join(', ')}');
    debugPrint('  - daily_tasks: ${(plan['daily_tasks'] as List?)?.length ?? 0} 条');
    debugPrint('  - weekly_plans: ${(plan['weekly_plans'] as List?)?.length ?? 0} 条');

    final dailyTasks = plan['daily_tasks'] as List<dynamic>? ?? [];
    final weeklyPlans = plan['weekly_plans'] as List<dynamic>? ?? [];

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 550, maxWidth: 420),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.tertiary.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 头部 - 珊瑚红点缀
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.tertiaryContainer.withOpacity(0.5),
                      Colors.white,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.tertiary, AppColors.tertiary.withOpacity(0.8)],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tertiary.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 26),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'AI 计划已生成',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.neutral900,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '已为你定制专属学习计划',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.neutral500,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // 内容区
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 周计划概览
                      if (weeklyPlans.isNotEmpty) ...[
                        Row(
                          children: [
                            Icon(Icons.flag_rounded, size: 18, color: AppColors.tertiary),
                            const SizedBox(width: 8),
                            const Text(
                              '阶段目标',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.neutral800,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...weeklyPlans.take(3).map((week) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.15),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'W${week['week_number']}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      week['title'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.neutral800,
                                      ),
                                    ),
                                    if (week.containsKey('description'))
                                      Text(
                                        week['description'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.neutral500,
                                          height: 1.3,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                        const SizedBox(height: 20),
                      ],
                      // 前 3 天的任务
                      if (dailyTasks.isNotEmpty) ...[
                        Row(
                          children: [
                            Icon(Icons.event_rounded, size: 18, color: AppColors.tertiary),
                            const SizedBox(width: 8),
                            const Text(
                              '前 3 天任务',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.neutral800,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...dailyTasks.take(3).toList().asMap().entries.map((entry) {
                          final index = entry.key;
                          final task = entry.value;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: AppColors.neutral200.withOpacity(0.5),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.neutral200.withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 序号徽章
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.tertiary.withOpacity(0.15),
                                        AppColors.tertiary.withOpacity(0.05),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'D${index + 1}',
                                      style: TextStyle(
                                        color: AppColors.tertiary,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task['title'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.neutral800,
                                          height: 1.3,
                                        ),
                                      ),
                                      if (task.containsKey('description')) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          task['description'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: AppColors.neutral500,
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                      if (task.containsKey('estimated_minutes')) ...[
                                        const SizedBox(height: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryContainer.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.access_time_rounded,
                                                size: 12,
                                                color: AppColors.primary,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${task['estimated_minutes']}分钟',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ],
                  ),
                ),
              ),
              // 底部按钮
              Container(
                decoration: BoxDecoration(
                  color: AppColors.neutral50,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: AppColors.neutral200.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // 关闭 AI 计划对话框
                      Navigator.pop(context, true); // 关闭创建页面并返回 true
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.tertiary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: AppColors.tertiary.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '开始执行计划',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getFriendlyErrorMessage(String error) {
    // 将常见错误转换为友好的中文提示
    if (error.contains('SOCKET_EXCEPTION') || error.contains('Connection failed')) {
      return '网络连接失败，请检查后端服务是否运行';
    }
    if (error.contains('认证失败') || error.contains('401')) {
      return '请先登录后再创建目标';
    }
    if (error.contains('timeout')) {
      return '请求超时，请重试';
    }
    return '创建失败：$error';
  }
}

// ==================== 打卡屏幕 ====================
class CheckinScreen extends StatefulWidget {
  const CheckinScreen({super.key});

  @override
  State<CheckinScreen> createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen> {
  final CheckinService _checkinService = CheckinService();
  final GoalService _goalService = GoalService();
  List<dynamic> _goals = [];
  List<dynamic> _recentCheckins = [];
  int _streakCount = 0;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final goals = await _goalService.getGoals();
      final checkins = await _checkinService.getCheckins();
      final streak = await _checkinService.getStreak();
      setState(() {
        _goals = goals;
        _recentCheckins = checkins.take(5).toList();
        _streakCount = streak;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _showCheckinDialog(dynamic goal) {
    final notesController = TextEditingController();
    int moodRating = 4;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('完成打卡！', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.neutral900)),
              const SizedBox(height: 8),
              Text('目标：${goal['title']}', style: TextStyle(color: AppColors.neutral600)),
              const SizedBox(height: 20),
              TextField(
                controller: notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: '分享学习心得...（可选）',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
              const SizedBox(height: 16),
              Text('心情评分：', style: TextStyle(color: AppColors.neutral600)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [1, 2, 3, 4, 5].map((rating) {
                  return SizedBox(
                    width: 44,
                    child: IconButton(
                      icon: Icon(
                        rating <= moodRating ? Icons.sentiment_satisfied : Icons.sentiment_satisfied_outlined,
                        color: rating <= moodRating ? AppColors.tertiary : AppColors.neutral400,
                        size: 32,
                      ),
                      onPressed: () => setState(() => moodRating = rating),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final result = await _checkinService.createCheckin(
                        goalId: goal['id'],
                        notes: notesController.text.isNotEmpty ? notesController.text : null,
                        moodRating: moodRating,
                      );
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('打卡成功！')),
                        );
                        // 从后端返回的数据中获取更新后的 goal 信息
                        if (result.containsKey('goal') && result['goal'] != null) {
                          final updatedGoal = result['goal'] as Map<String, dynamic>;
                          debugPrint('【打卡后更新】goal_id=${updatedGoal['id']}, current_day=${updatedGoal['current_day']}, today_task=${updatedGoal['today_task']}');
                          // 更新本地 goal 数据中的 today_task 和 current_day
                          setState(() {
                            final index = _goals.indexWhere((g) => g['id'] == goal['id']);
                            if (index >= 0) {
                              _goals[index]['current_day'] = updatedGoal['current_day'];
                              _goals[index]['today_task'] = updatedGoal['today_task'];
                            }
                          });
                        }
                        _loadData();
                      }
                    } catch (e) {
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('打卡失败：$e')),
                        );
                      }
                    }
                  },
                  child: const Text('完成打卡'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('打卡'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('打卡'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: AppColors.error),
              const SizedBox(height: 32),
              const Text('加载失败', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.neutral900)),
              Text(_errorMessage ?? '未知错误', style: TextStyle(fontSize: 16, color: AppColors.neutral500)),
              const SizedBox(height: 40),
              ElevatedButton(onPressed: _loadData, child: const Text('重试')),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('打卡'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 连续打卡统计 - 渐变卡片
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.tertiary, AppColors.tertiaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: AppShadows.coloredTertiary,
              ),
              child: Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.local_fire_department_rounded, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$_streakCount',
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -1),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '连续打卡天数',
                        style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            // 我的目标
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientPrimary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('我的目标', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.neutral800, letterSpacing: -0.3)),
              ],
            ),
            const SizedBox(height: 16),
            if (_goals.isEmpty)
              Container(
                padding: const EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.neutral200),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(Icons.menu_book_rounded, size: 64, color: AppColors.primary),
                      ),
                      const SizedBox(height: 20),
                      const Text('还没有目标', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.neutral800)),
                      const SizedBox(height: 8),
                      Text('创建一个目标开始打卡吧', style: TextStyle(fontSize: 14, color: AppColors.neutral500)),
                    ],
                  ),
                ),
              )
            else
              ..._goals.map((goal) {
                final int totalDays = (goal['duration_days'] ?? 30);
                final int currentDay = (goal['current_day'] ?? 0);
                final double progress = totalDays > 0 ? currentDay / totalDays : 0.0;

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.neutral200.withOpacity(0.6), width: 1),
                    boxShadow: AppShadows.md,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.primaryContainer, AppColors.primary.withOpacity(0.15)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 1),
                          ),
                          child: const Icon(Icons.menu_book_rounded, color: AppColors.primary, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                goal['title'] ?? '未命名目标',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.neutral900, letterSpacing: -0.2),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: AppColors.neutral150,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: FractionallySizedBox(
                                          widthFactor: progress,
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: 8,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryLight]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    '${(progress * 100).toInt()}%',
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () => _showCheckinDialog(goal),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Icon(Icons.check_circle_rounded, size: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            const SizedBox(height: 28),
            // 最近打卡记录
            if (_recentCheckins.isNotEmpty) ...[
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientTertiary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('最近打卡', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.neutral800, letterSpacing: -0.3)),
                ],
              ),
              const SizedBox(height: 16),
              ..._recentCheckins.map((checkin) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.neutral200.withOpacity(0.5), width: 1),
                  boxShadow: AppShadows.sm,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [AppColors.tertiaryContainer, Colors.white]),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.tertiary.withOpacity(0.2), width: 1.5),
                        ),
                        child: const Icon(Icons.check_circle_rounded, color: AppColors.tertiary, size: 26),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              checkin['notes'] ?? '打卡记录',
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.neutral800, letterSpacing: -0.2),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                ...(List.generate(checkin['mood_rating'] ?? 0, (i) => const Text('⭐', style: TextStyle(fontSize: 14)))),
                                if ((checkin['mood_rating'] ?? 0) == 0)
                                  Text('未评分', style: TextStyle(fontSize: 12, color: AppColors.neutral400)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _formatDate(checkin['created_at']),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.neutral600),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return '';
    try {
      final date = DateTime.parse(dateStr);
      return '${date.month}/${date.day}';
    } catch (e) {
      return '';
    }
  }
}

// ==================== 目标详情屏幕 ====================
class GoalDetailScreen extends StatefulWidget {
  final String goalId;
  const GoalDetailScreen({super.key, required this.goalId});

  @override
  State<GoalDetailScreen> createState() => _GoalDetailScreenState();
}

class _GoalDetailScreenState extends State<GoalDetailScreen> {
  final GoalService _goalService = GoalService();
  final CheckinService _checkinService = CheckinService();
  Map<String, dynamic>? _goal;
  List<dynamic> _tasks = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadGoalData();
  }

  Future<void> _loadGoalData() async {
    setState(() => _isLoading = true);
    try {
      final goal = await _goalService.getGoal(widget.goalId);
      final tasks = await _goalService.getGoalTasks(widget.goalId);
      setState(() {
        _goal = goal;
        _tasks = tasks;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('目标详情'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('目标详情'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 80, color: AppColors.error),
                const SizedBox(height: 32),
                const Text('加载失败', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.neutral900)),
                const SizedBox(height: 12),
                Text(_errorMessage ?? '未知错误', style: TextStyle(fontSize: 16, color: AppColors.neutral500)),
                const SizedBox(height: 40),
                ElevatedButton(onPressed: _loadGoalData, child: const Text('重试')),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_goal?['title'] ?? '目标详情', style: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: -0.3)),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 进度卡片 - 渐变背景
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: AppShadows.coloredPrimary,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '进度',
                            style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '第${_goal?['current_day'] ?? 0}天 / 共${_goal?['duration_days'] ?? 0}天',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -0.3),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${(((_goal?['current_day'] ?? 0) / (_goal?['duration_days'] ?? 1)) * 100).toInt()}%',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: -0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: LinearProgressIndicator(
                        value: ((_goal?['current_day'] ?? 0) / (_goal?['duration_days'] ?? 1)).toDouble(),
                        backgroundColor: Colors.transparent,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            // 今日任务卡片
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientTertiary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('今日任务', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.neutral800, letterSpacing: -0.3)),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.tertiaryContainer, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.tertiary.withOpacity(0.2), width: 1.5),
                boxShadow: AppShadows.md,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [AppColors.tertiary, AppColors.tertiaryLight]),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: AppShadows.coloredTertiary,
                          ),
                          child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _goal?['today_task'] ?? '暂无任务',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.neutral900, letterSpacing: -0.3),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.access_time_rounded, size: 14, color: AppColors.neutral500),
                                  const SizedBox(width: 4),
                                  Text(
                                    '预计：${_goal?['estimated_time'] ?? '40 分钟'}',
                                    style: TextStyle(fontSize: 12, color: AppColors.neutral500, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => _showCheckinDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.tertiary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_rounded, size: 22),
                            SizedBox(width: 10),
                            Text('打卡完成', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.3)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            // 任务列表
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientPrimary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('任务列表', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.neutral800, letterSpacing: -0.3)),
              ],
            ),
            const SizedBox(height: 16),
            if (_tasks.isEmpty) ...[
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.neutral200),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.info.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.info_outline_rounded, color: AppColors.info, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('暂无任务数据', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.neutral800)),
                          const SizedBox(height: 4),
                          Text('AI 正在为你生成每日任务，请稍后刷新', style: TextStyle(fontSize: 13, color: AppColors.neutral500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              for (var task in _tasks) _buildTaskItemFromData(task),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(bool completed, String title, String meta, {bool isToday = false}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: completed ? AppColors.success : (isToday ? AppColors.primary : AppColors.neutral300),
            shape: BoxShape.circle,
          ),
          child: completed
              ? const Icon(Icons.check, size: 16, color: Colors.white)
              : null,
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: completed ? TextDecoration.lineThrough : null,
            color: completed ? AppColors.neutral400 : AppColors.neutral900,
          ),
        ),
        subtitle: Text(meta, style: TextStyle(fontSize: 12, color: AppColors.neutral500)),
      ),
    );
  }

  Widget _buildTaskItemFromData(dynamic task) {
    final bool completed = task['status'] == 'completed';
    final String title = task['title'] ?? '未命名任务';
    final int dayNumber = task['day_number'] ?? 0;
    final int? estimatedMinutes = task['estimated_minutes'];
    final String description = task['description'] ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: completed ? AppColors.neutral200.withOpacity(0.5) : AppColors.neutral200, width: 1),
        boxShadow: completed ? [] : AppShadows.sm,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 天数徽章
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: completed
                      ? [AppColors.neutral300, AppColors.neutral400]
                      : [AppColors.primary, AppColors.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: completed ? [] : AppShadows.coloredPrimary,
              ),
              child: Center(
                child: completed
                    ? const Icon(Icons.check_rounded, color: Colors.white, size: 20)
                    : Text(
                        'D$dayNumber',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 0.5,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 14),
            // 任务内容
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: completed ? AppColors.neutral400 : AppColors.neutral900,
                      letterSpacing: -0.2,
                      decoration: completed ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: completed ? AppColors.neutral400 : AppColors.neutral600,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (estimatedMinutes != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded, size: 12, color: completed ? AppColors.neutral400 : AppColors.neutral500),
                        const SizedBox(width: 4),
                        Text(
                          '${estimatedMinutes}分钟',
                          style: TextStyle(
                            fontSize: 11,
                            color: completed ? AppColors.neutral400 : AppColors.neutral500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCheckinDialog(BuildContext context) {
    final notesController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('完成打卡！🎉', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.neutral900)),
              const SizedBox(height: 8),
              Text('今天：${_goal?['today_task'] ?? '暂无任务'}', style: TextStyle(color: AppColors.neutral600)),
              const SizedBox(height: 20),
              TextField(
                controller: notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: '分享学习心得...（可选）',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final result = await _checkinService.createCheckin(
                        goalId: widget.goalId,
                        notes: notesController.text.isNotEmpty ? notesController.text : null,
                      );
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('打卡成功！')),
                        );
                        // 从后端返回的数据中获取更新后的 goal 信息
                        if (result.containsKey('goal') && result['goal'] != null) {
                          final updatedGoal = result['goal'] as Map<String, dynamic>;
                          debugPrint('【打卡后更新】goal_id=${updatedGoal['id']}, current_day=${updatedGoal['current_day']}, today_task=${updatedGoal['today_task']}');
                          // 更新本地 _goal 数据
                          setState(() {
                            _goal?['current_day'] = updatedGoal['current_day'];
                            _goal?['today_task'] = updatedGoal['today_task'];
                          });
                        }
                        _loadGoalData(); // 刷新页面数据
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('打卡失败：$e')),
                        );
                      }
                    }
                  },
                  child: const Text('完成打卡'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== 社群屏幕 ====================
class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final PartnerService _partnerService = PartnerService();
  List<dynamic> _partners = [];
  List<dynamic> _challenges = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final partners = await _partnerService.getPartners();
      final challenges = await _partnerService.getChallenges(status: 'active');
      setState(() {
        _partners = partners;
        _challenges = challenges;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('学习伙伴'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('学习伙伴'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: AppColors.error),
              const SizedBox(height: 32),
              const Text('加载失败', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.neutral900)),
              Text(_errorMessage ?? '未知错误', style: TextStyle(fontSize: 16, color: AppColors.neutral500)),
              const SizedBox(height: 40),
              ElevatedButton(onPressed: _loadData, child: const Text('重试')),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('学习伙伴'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('和你一起打卡的人 (${_partners.length})', style: TextStyle(fontSize: 14, color: AppColors.neutral600, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          if (_partners.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.people_outline, size: 80, color: AppColors.neutral300),
                    const SizedBox(height: 16),
                    Text('还没有学习伙伴', style: TextStyle(fontSize: 16, color: AppColors.neutral500)),
                  ],
                ),
              ),
            )
          else
            ..._partners.map((partner) => _buildUserItem(
              partner['partner_username'] ?? '未知用户',
              partner['partner_avatar_url'],
              partner['status'] ?? 'accepted',
            )),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.emoji_events, color: Colors.amber[700]),
                      const SizedBox(width: 8),
                      Text('组队 PK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.neutral800)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_challenges.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text('暂无正在进行的挑战', style: TextStyle(color: AppColors.neutral500)),
                      ),
                    )
                  else
                    ..._challenges.map((challenge) => InkWell(
                      onTap: () => _joinChallenge(challenge['id']),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Text(challenge['icon'] ?? '🎯', style: const TextStyle(fontSize: 28)),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    challenge['name'] ?? '未命名挑战',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.neutral900),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '已有 ${challenge['current_participants'] ?? 0} 人参加',
                                    style: TextStyle(fontSize: 13, color: AppColors.neutral500),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right, color: AppColors.neutral400),
                          ],
                        ),
                      ),
                    )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserItem(String username, String? avatarUrl, String status) {
    final statusColors = {
      'pending': AppColors.warning,
      'accepted': AppColors.success,
      'rejected': AppColors.error,
    };
    final statusLabels = {
      'pending': '等待接受',
      'accepted': '已接受',
      'rejected': '已拒绝',
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.neutral200,
            borderRadius: BorderRadius.circular(24),
          ),
          child: avatarUrl != null
              ? ClipOval(child: Image.network(avatarUrl, fit: BoxFit.cover))
              : const Center(child: Text('👤', style: TextStyle(fontSize: 20))),
        ),
        title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.neutral900)),
        subtitle: Text(
          statusLabels[status] ?? '未知状态',
          style: TextStyle(fontSize: 12, color: statusColors[status] ?? AppColors.neutral600),
        ),
      ),
    );
  }

  Future<void> _joinChallenge(String challengeId) async {
    try {
      await _partnerService.joinChallenge(challengeId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('已成功加入挑战！')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('加入失败：$e')),
        );
      }
    }
  }
}

// ==================== 个人中心屏幕 ====================
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  final CheckinService _checkinService = CheckinService();
  Map<String, dynamic>? _user;
  int _streakCount = 0;
  int _completedGoals = 0;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() => _isLoading = true);
    try {
      final user = await _authService.getCurrentUser();
      final streak = await _checkinService.getStreak();
      setState(() {
        _user = user;
        _streakCount = streak;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _handleLogout() async {
    try {
      await _authService.logout();
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('登出失败：$e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('我的'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('我的'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: AppColors.error),
              const SizedBox(height: 32),
              const Text('加载失败', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.neutral900)),
              Text(_errorMessage ?? '未知错误', style: TextStyle(fontSize: 16, color: AppColors.neutral500)),
              const SizedBox(height: 40),
              ElevatedButton(onPressed: _loadUserData, child: const Text('重试')),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: '登出',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppColors.tertiary, AppColors.warning]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: _user?['avatar_url'] != null
                  ? ClipOval(child: Image.network(_user!['avatar_url']!, fit: BoxFit.cover))
                  : const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              _user?['username'] ?? '用户名',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.neutral900),
            ),
            Text(
              _user?['email'] ?? '',
              style: TextStyle(fontSize: 14, color: AppColors.neutral500),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('$_streakCount', '连续打卡'),
                    _buildStatItem('$_completedGoals', '完成目标'),
                    _buildStatItem('0', '获得成就'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  _buildSettingItem(Icons.notifications_outlined, '提醒设置'),
                  const Divider(height: 1, indent: 60),
                  _buildSettingItem(Icons.lock_outline, '隐私设置'),
                  const Divider(height: 1, indent: 60),
                  _buildSettingItem(Icons.logout, '登出', onTap: _handleLogout),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 13, color: AppColors.neutral600)),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(color: AppColors.neutral900)),
      trailing: Icon(Icons.chevron_right, color: AppColors.neutral400),
      onTap: onTap ?? () {},
    );
  }
}
