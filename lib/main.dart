import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
          primary: Color(0xFF2D5A46),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFFE8F5EF),
          onPrimaryContainer: Color(0xFF0F1F18),
          secondary: Color(0xFF87A892),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color(0xFFD1E8DC),
          onSecondaryContainer: Color(0xFF1F3D30),
          tertiary: Color(0xFFE07A5F),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFFFF5F3),
          onTertiaryContainer: Color(0xFF3D1F18),
          error: Color(0xFFC96859),
          onError: Color(0xFFFFFFFF),
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF3D342B),
          outline: Color(0xFFE6E2D8),
        ),
        // 背景色：暖灰系
        scaffoldBackgroundColor: const Color(0xFFFAF9F7),
        // 字体配置 - 根据 DESIGN.md
        textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
          bodyLarge: GoogleFonts.dmSans(fontSize: 16, color: const Color(0xFF3D342B)),
          bodyMedium: GoogleFonts.dmSans(fontSize: 14, color: const Color(0xFF7D7265)),
          headlineLarge: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xFF3D342B)),
          headlineMedium: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w600, color: const Color(0xFF3D342B)),
          titleMedium: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF3D342B)),
          labelSmall: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w500, color: const Color(0xFF7D7265)),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFFFAF9F7),
          foregroundColor: Color(0xFF3D342B),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3D342B),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shadowColor: const Color(0xFF2D5A46).withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2D5A46),
            foregroundColor: const Color(0xFFFFFFFF),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF2D5A46),
            side: const BorderSide(color: Color(0xFF2D5A46)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE6E2D8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE6E2D8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF2D5A46), width: 2),
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
            colors: [Color(0xFF2D5A46), Color(0xFF1F3D30)],
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
            colors: [Color(0xFF2D5A46), Color(0xFF1F3D30)],
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
                          backgroundColor: const Color(0xFFE07A5F),
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
            selectedIcon: Icon(Icons.home, color: Color(0xFF2D5A46)),
            label: '首页',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            selectedIcon: Icon(Icons.check_circle, color: Color(0xFF2D5A46)),
            label: '打卡',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Color(0xFF2D5A46)),
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
      body: _hasGoals ? _buildGoalsList() : _buildEmptyState(),
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
                color: const Color(0xFF2D5A46).withOpacity(0.1),
                borderRadius: BorderRadius.circular(80),
              ),
              child: const Icon(
                Icons.my_location_outlined,
                size: 80,
                color: Color(0xFF2D5A46),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              '还没有目标',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '创建一个目标开始吧',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
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
            '进行中目标 (1)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          _buildGoalCard(
            icon: Icons.menu_book_rounded,
            title: '30 天读 5 本书',
            progress: 0.6,
            days: '第 18 天 / 共 30 天',
            todayTask: '读第 81-100 页',
          ),
          const SizedBox(height: 24),
          Card(
            color: const Color(0xFFF1F5F9),
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
                          color: Colors.grey[800],
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
                        foregroundColor: const Color(0xFF2D5A46),
                        side: const BorderSide(color: Color(0xFF2D5A46)),
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
                        foregroundColor: const Color(0xFF2D5A46),
                        side: const BorderSide(color: Color(0xFFE0E0E0)),
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

  Widget _buildGoalCard({
    required IconData icon,
    required String title,
    required double progress,
    required String days,
    required String todayTask,
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GoalDetailScreen()),
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
                      color: const Color(0xFF2D5A46).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: const Color(0xFF2D5A46), size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D5A46),
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
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2D5A46)),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    days,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D5A46),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.today, size: 18, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      '今天：$todayTask',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _goalController,
            decoration: InputDecoration(
              hintText: '请输入你的目标...',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF2D5A46), width: 2),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 32),
          Text(
            '或者选择一个模板：',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
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
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    Text(template['icon']!, style: const TextStyle(fontSize: 28)),
                    const SizedBox(width: 16),
                    Text(
                      template['title']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Icon(Icons.chevron_right, color: Colors.grey[400]),
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                selectedColor: const Color(0xFF2D5A46),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
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
                selectedColor: const Color(0xFF2D5A46),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GoalPreviewScreen()),
                );
              },
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
      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
    );
  }
}

// ==================== 目标预览屏幕 ====================
class GoalPreviewScreen extends StatelessWidget {
  const GoalPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('创建目标'),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF2D5A46),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.auto_awesome, size: 64, color: Color(0xFF2D5A46)),
            const SizedBox(height: 24),
            const Text(
              'AI 为你生成了计划',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('📚', style: TextStyle(fontSize: 24)),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            '30 天读 5 本书',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '可执行',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0,
                        backgroundColor: Color(0xFFE0E0E0),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2D5A46)),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem('预计时间', '30 天', Icons.calendar_today),
                        _buildInfoItem('每天需要', '约 40 分钟', Icons.timer),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('第 1 周：基础入门', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800])),
                    const SizedBox(height: 12),
                    _buildTaskItem('Day 1: 读第 1-20 页', '预计 40 分钟'),
                    _buildTaskItem('Day 2: 读第 21-40 页', '预计 40 分钟'),
                    _buildTaskItem('Day 3: 读第 41-60 页', '预计 40 分钟'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    child: const Text('调整计划'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Pop preview
                      Navigator.pop(context); // Pop create screen
                      // In real app, save the goal here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text('确认开始', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
      ],
    );
  }

  Widget _buildTaskItem(String title, String meta) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(meta, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
        ],
      ),
    );
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
        foregroundColor: const Color(0xFF2D5A46),
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
                  color: const Color(0xFF2D5A46).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  size: 60,
                  color: Color(0xFF2D5A46),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                '今日任务已完成！',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                '连续打卡 7 天，继续保持！',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== 目标详情屏幕 ====================
class GoalDetailScreen extends StatelessWidget {
  const GoalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('30 天读 5 本书'),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF2D5A46),
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
                        const Text('第 18 天 / 共 30 天', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2D5A46),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('60%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: Color(0xFFE0E0E0),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2D5A46)),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('今日任务', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700])),
            const SizedBox(height: 12),
            Card(
              color: const Color(0xFFF1F5F9),
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
                            color: const Color(0xFF2D5A46).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.menu_book, color: const Color(0xFF2D5A46)),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('读第 81-100 页', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('预计耗时：40 分钟', style: TextStyle(fontSize: 13, color: Colors.grey)),
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
                          backgroundColor: const Color(0xFF2D5A46),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('任务列表', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700])),
            const SizedBox(height: 12),
            _buildTaskItem(true, 'Day 1: 读第 1-20 页', '已完成'),
            _buildTaskItem(true, 'Day 2: 读第 21-40 页', '已完成'),
            _buildTaskItem(true, 'Day 3: 读第 41-60 页', '已完成'),
            _buildTaskItem(false, 'Day 18: 读第 81-100 页', '今天', isToday: true),
            _buildTaskItem(false, 'Day 19: 读第 101-120 页', '待完成'),
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
            color: completed ? Colors.green : (isToday ? const Color(0xFF2D5A46) : Colors.grey[300]),
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
            color: completed ? Colors.grey : null,
          ),
        ),
        subtitle: Text(meta, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
      ),
    );
  }

  void _showCheckinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('完成打卡！🎉', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('今天你读了第 81-100 页', style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 20),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: '分享学习心得...（可选）',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Text('🤖', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('AI 点评：', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text(
                            '太棒了！你已经连续打卡 7 天了，保持这个节奏，预计可以提前 2 天完成！',
                            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('完成打卡'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.share),
                  label: const Text('分享海报'),
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
        foregroundColor: const Color(0xFF2D5A46),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('和你一起打卡的人 (23)', style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w600)),
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
                      Text('组队 PK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800])),
                    ],
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
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
                                Text('7 天打卡挑战赛', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                SizedBox(height: 4),
                                Text('已有 56 人参加', style: TextStyle(fontSize: 13, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right, color: Colors.grey[400]),
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
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(child: Text(avatar, style: const TextStyle(fontSize: 20))),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('目标：$goal', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF2D5A46).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('🔥 $streak 天', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D5A46))),
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
        foregroundColor: const Color(0xFF2D5A46),
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
                gradient: const LinearGradient(colors: [Color(0xFFE07A5F), Color(0xFFD4A373)]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text('用户名', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('已加入 7 天', style: TextStyle(fontSize: 14, color: Colors.grey[500])),
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
                    Text('🏅 我的成就', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800])),
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
        Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2D5A46))),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
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
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, {bool showBadge = false}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF2D5A46)),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showBadge)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF2D5A46),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          if (showBadge) const SizedBox(width: 8),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
      onTap: () {},
    );
  }
}
