import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_effects.dart';
import '../widgets/glass_bottom_bar.dart';
import '../providers/user_prefs_provider.dart';
import '../utils/sacred_styles.dart';
import 'library_vault_screen.dart';
import 'modern_home_screen.dart';
import 'statistics_screen.dart';
import 'profile_screen.dart';

class HomeDashboardScreen extends ConsumerStatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  ConsumerState<HomeDashboardScreen> createState() =>
      _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends ConsumerState<HomeDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ModernHomeScreen(),
    const LibraryVaultScreen(),
    const StatisticsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userPrefs = ref.watch(userPrefsProvider);
    final isDark = theme.brightness == Brightness.dark;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBody: true,
      body: Stack(
        children: [
          const Positioned.fill(child: GrainyTextureOverlay(opacity: 0.01)),
          RepaintBoundary(
            child: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
          ),
          _buildFloatingModeToggle(context, userPrefs.isModernMode, topPadding),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 32), // Perfectly docked for 80px bar
        child: BouncyButton(
          onTap: () {},
          child: Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              gradient: const SweepGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                  AppColors.primary,
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.2)
                    : Colors.black.withValues(alpha: 0.1),
                width: 2,
              ),
            ),
            child: const Icon(Icons.add_rounded, color: Colors.white, size: 38),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildFloatingModeToggle(
      BuildContext context, bool isModern, double topPadding) {
    final theme = Theme.of(context);
    return Positioned(
      top: topPadding + 8,
      right: 24,
      child: BouncyButton(
        onTap: () {
          ref.read(userPrefsProvider.notifier).toggleModernMode();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Switched to ${!isModern ? 'Modern' : 'Beginner'} Mode'),
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: theme.colorScheme.surface,
            ),
          );
        },
        child: PremiumGlassContainer(
          blur: 10,
          opacity: 0.1,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(isModern ? Icons.bolt_rounded : Icons.auto_awesome_rounded,
                    color: AppColors.primary, size: 18),
                const SizedBox(width: 8),
                Text(
                  isModern ? 'MODERN' : 'BEGINNER',
                  style: SacredStyles.withColor(
                    SacredStyles.mono10Bold,
                    theme.colorScheme.onSurface,
                  ).copyWith(letterSpacing: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
