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

  // 辅色 - 鼠尾草绿
  static const secondary = Color(0xFF87A892);
  static const secondaryContainer = Color(0xFFD1E8DC);

  // 点缀色 - 珊瑚红
  static const tertiary = Color(0xFFE07A5F);
  static const tertiaryContainer = Color(0xFFFFF5F3);
  static const onTertiaryContainer = Color(0xFF3D1F18);

  // 中性色 - 暖灰系
  static const neutral50 = Color(0xFFFAF9F7);    // 主背景
  static const neutral100 = Color(0xFFF2F0EB);   // 次级背景
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
  static const cardBackground = Color(0xFFF1F5F9);
  static const inputBackground = Color(0xFFFFFFFF);
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
    );
  }
}

// ==================== 启动页 ====================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.my_location_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'AI 目标教练',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'AI Goal Coach',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '把"我想"变成"我做到"',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== 新手引导页 ====================
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'icon': Icons.edit_note_rounded,
      'title': '告诉我你想做什么',
      'items': '"30 天读 5 本书"\n"每天冥想 10 分钟"\n"坚持早起 6 点起床"',
    },
    {
      'icon': Icons.smart_toy_outlined,
      'title': 'AI 帮你拆成每天任务',
      'items': 'Day 1: 读第 1-20 页\nDay 2: 读第 21-40 页\nDay 3: 读第 41-60 页',
    },
    {
      'icon': Icons.check_circle_outline_rounded,
      'title': '每天打卡，看着自己进步',
      'items': '连续打卡 7 天！🎉\n已完成 30%',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              _pages[index]['icon'] as IconData,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 48),
                          Text(
                            _pages[index]['title']!,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _pages[index]['items']!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                height: 1.8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: _currentPage == index ? 28 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: 200,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage < _pages.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    const HomeScreen(),
                                transitionsBuilder:
                                    (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(opacity: animation, child: child);
                                },
                                transitionDuration: const Duration(milliseconds: 500),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.tertiary,
                          foregroundColor: const Color(0xFFFFFFFF),
                          elevation: 8,
                          shadowColor: Colors.black.withOpacity(0.2),
                        ),
                        child: Text(
                          _currentPage < _pages.length - 1 ? '下一步' : '开始设定目标',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
      setState(() {
        _goals = goals;
        _hasGoals = goals.isNotEmpty;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        // 检测是否为认证失败
        if (_errorMessage!.contains('认证失败') || _errorMessage!.contains('401')) {
          _navigateToLogin(context);
        }
        _isLoading = false;
      });
    }
  }

  void _navigateToLogin(BuildContext context) {
    // 跳转到启动页（实际应用中应该跳转到登录页面）
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SplashScreen()),
        (route) => false,
      );
    });
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
                  setState(() => _hasGoals = true);
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
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(80),
              ),
              child: const Icon(
                Icons.error_outline,
                size: 80,
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              '加载失败',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.neutral900,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _errorMessage ?? '未知错误',
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
                onPressed: _loadGoals,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  '重试',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    final int totalDays = (goal['total_days'] ?? 30);
    final int currentDay = (goal['current_day'] ?? 0);
    final double progress = totalDays > 0 ? currentDay / totalDays : 0.0;

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GoalDetailScreen(goalId: goal['id']),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.menu_book_rounded, color: AppColors.primary, size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      goal['title'] ?? '未命名目标',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral900,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '去打卡',
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: AppColors.neutral200,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '第$currentDay 天 / 共$totalDays 天',
                    style: TextStyle(fontSize: 13, color: AppColors.neutral600),
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.today, size: 18, color: AppColors.neutral600),
                    const SizedBox(width: 8),
                    Text(
                      '今天：${goal['today_task'] ?? '暂无任务'}',
                      style: const TextStyle(fontSize: 14, color: AppColors.neutral700),
                    ),
                  ],
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
  String _selectedLevel = '零基础';
  int _selectedDurationDays = 30;
  final GoalService _goalService = GoalService();
  bool _isCreating = false;

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
            children: ['30 分钟', '1 小时', '2 小时', '灵活'].map((time) {
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
            }).toList(),
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
              {'label': '7 天', 'days': 7},
              {'label': '14 天', 'days': 14},
              {'label': '30 天', 'days': 30},
              {'label': '60 天', 'days': 60},
              {'label': '90 天', 'days': 90},
            ].map((option) {
              final days = option['days'] as int;
              final label = option['label'] as String;
              final isSelected = _selectedDurationDays == days;
              return ChoiceChip(
                label: Text(label),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) setState(() => _selectedDurationDays = days);
                },
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppColors.neutral900,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _isCreating ? null : _createGoal,
              icon: _isCreating
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.auto_awesome),
              label: Text(_isCreating ? '创建中...' : '生成计划', style: const TextStyle(fontSize: 18)),
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

  Future<void> _createGoal() async {
    setState(() => _isCreating = true);
    try {
      // 计算日期：从今天开始，根据选择的持续时间计算结束日期
      final startDate = DateTime.now();
      final endDate = startDate.add(Duration(days: _selectedDurationDays));

      final result = await _goalService.createGoal(
        title: _goalController.text,
        description: '通过 AI 辅助达成目标',
        icon: '🎯',
        startDate: startDate,
        endDate: endDate,
        dailyTimeAvailable: _selectedTime,
        experienceLevel: _selectedLevel,
      );

      if (mounted) {
        setState(() => _isCreating = false);
        // 创建成功，返回首页
        Navigator.pop(context, true);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('目标创建成功！')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isCreating = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: _getFriendlyErrorMessage(e.toString())),
        );
      }
    }
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
class CheckinScreen extends StatelessWidget {
  const CheckinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('快速打卡'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  size: 60,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                '今日任务已完成！',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.neutral900),
              ),
              const SizedBox(height: 16),
              Text(
                '连续打卡 7 天，继续保持！',
                style: TextStyle(fontSize: 16, color: AppColors.neutral600),
              ),
            ],
          ),
        ),
      ),
    );
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
        title: Text(_goal?['title'] ?? '目标详情'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '第${_goal?['current_day'] ?? 0}天 / 共${_goal?['total_days'] ?? 0}天',
                          style: const TextStyle(fontSize: 14, color: AppColors.neutral500),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${(((_goal?['current_day'] ?? 0) / (_goal?['total_days'] ?? 1)) * 100).toInt()}%',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: ((_goal?['current_day'] ?? 0) / (_goal?['total_days'] ?? 1)).toDouble(),
                        backgroundColor: AppColors.neutral200,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('今日任务', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.neutral700)),
            const SizedBox(height: 12),
            Card(
              color: AppColors.cardBackground,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.menu_book, color: AppColors.primary),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _goal?['today_task'] ?? '暂无任务',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.neutral900),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '预计耗时：${_goal?['estimated_time'] ?? '40 分钟'}',
                                style: const TextStyle(fontSize: 13, color: AppColors.neutral500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () => _showCheckinDialog(context),
                        icon: const Icon(Icons.check_circle_outline),
                        label: const Text('打卡完成'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('任务列表', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.neutral700)),
            const SizedBox(height: 12),
            if (_tasks.isEmpty) ...[
              _buildTaskItem(false, '暂无任务数据', 'AI 正在为你生成每日任务，请稍后刷新'),
            ] else ...[
              for (var task in _tasks)
                _buildTaskItemFromData(task),
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
    final String meta = task['description'] ?? '';

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: completed ? AppColors.success : AppColors.neutral300,
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
        subtitle: meta.isNotEmpty ? Text(meta, style: TextStyle(fontSize: 12, color: AppColors.neutral500)) : null,
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
                      await _checkinService.createCheckin(
                        goalId: widget.goalId,
                        notes: notesController.text.isNotEmpty ? notesController.text : null,
                      );
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('打卡成功！')),
                        );
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
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学习伙伴'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('和你一起打卡的人 (23)', style: TextStyle(fontSize: 14, color: AppColors.neutral600, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          _buildUserItem('👤', '张三', '30 天读 5 本书', 15),
          _buildUserItem('👤', '李四', '30 天读 5 本书', 12),
          _buildUserItem('👤', '王五', '30 天读 5 本书', 8),
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
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Text('🎯', style: TextStyle(fontSize: 28)),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('7 天打卡挑战赛', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.neutral900)),
                                SizedBox(height: 4),
                                Text('已有 56 人参加', style: TextStyle(fontSize: 13, color: AppColors.neutral500)),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right, color: AppColors.neutral400),
                        ],
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

  Widget _buildUserItem(String avatar, String name, String goal, int streak) {
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
          child: Center(child: Text(avatar, style: const TextStyle(fontSize: 20))),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.neutral900)),
        subtitle: Text('目标：$goal', style: TextStyle(fontSize: 12, color: AppColors.neutral600)),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('🔥 $streak 天', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
        ),
      ),
    );
  }
}

// ==================== 个人中心屏幕 ====================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
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
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text('用户名', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.neutral900)),
            Text('已加入 7 天', style: TextStyle(fontSize: 14, color: AppColors.neutral500)),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('7', '已坚持天数'),
                    _buildStatItem('2', '完成目标'),
                    _buildStatItem('3', '获得成就'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🏅 我的成就', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.neutral800)),
                    const SizedBox(height: 12),
                    _buildAchievementItem('🏅', '连续打卡 7 天', '2026-03-23 获得'),
                    _buildAchievementItem('🏅', '完成第一个目标', '2026-03-20 获得'),
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
                  _buildSettingItem(Icons.star_outline, '付费会员', showBadge: true),
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

  Widget _buildAchievementItem(String icon, String title, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.neutral900)),
                Text(date, style: TextStyle(fontSize: 12, color: AppColors.neutral500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, {bool showBadge = false}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(color: AppColors.neutral900)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showBadge)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          if (showBadge) const SizedBox(width: 8),
          Icon(Icons.chevron_right, color: AppColors.neutral400),
        ],
      ),
      onTap: () {},
    );
  }
}
