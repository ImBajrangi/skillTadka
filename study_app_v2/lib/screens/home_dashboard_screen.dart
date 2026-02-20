import 'package:flutter/material.dart';
import 'package:study_app/screens/beginner_home_screen.dart';
import 'package:study_app/screens/modern_home_screen.dart';
import 'package:study_app/theme/app_theme.dart';
import 'package:study_app/widgets/premium_effects.dart';
import 'dart:ui';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  bool _isModern = true;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          const GrainyTextureOverlay(opacity: 0.03),
          _isModern ? const ModernHomeScreen() : const BeginnerHomeScreen(),
          _buildFloatingModeToggle(),
          _buildGlassNavbar(),
        ],
      ),
    );
  }

  Widget _buildFloatingModeToggle() {
    return Positioned(
      top: 60,
      right: 24,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isModern = !_isModern;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Switched to ${_isModern ? 'Modern' : 'Beginner'} Mode'),
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: AppColors.textMain,
            ),
          );
        },
        child: PremiumGlassContainer(
          blur: 10,
          opacity: 0.2,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_isModern ? Icons.bolt : Icons.auto_awesome,
                    color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  _isModern ? 'MODERN' : 'BEGINNER',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassNavbar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 90,
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: PremiumGlassContainer(
          blur: 15,
          opacity: 0.1,
          borderRadius: BorderRadius.circular(28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_rounded, 'Home'),
              _buildNavItem(1, Icons.search_rounded, 'Search'),
              const SizedBox(width: 40),
              _buildNavItem(2, Icons.folder_open_rounded, 'Library'),
              _buildNavItem(3, Icons.person_rounded, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  isActive ? AppColors.primaryAction : AppColors.textSecondary,
              size: 26,
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: AppColors.primaryAction,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
