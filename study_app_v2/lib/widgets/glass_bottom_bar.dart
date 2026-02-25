import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'premium_effects.dart';

class GlassBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const GlassBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SizedBox(
      // Fixed YouTube-Style Dock with Extreme Contrast
      height: 60 + bottomPadding,
      width: double.infinity,
      child: PremiumGlassContainer(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        blur: 20, // Increased blur for the "White/Black" glass feel
        // Extreme opacity as requested: 0.95 for Dark (Onyx), 1.0 for Light (Pure White)
        opacity: isDark ? 0.95 : 1.0,
        fillColor: isDark ? Colors.black : Colors.white,
        borderColor: isDark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.black.withValues(alpha: 0.05),
        child: LayoutBuilder(builder: (context, constraints) {
          const fabWidth = 60.0;

          return Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildNavItem(context, 0, Icons.grid_view_rounded),
                ),
                Expanded(
                  child: _buildNavItem(context, 1, Icons.auto_stories_rounded),
                ),
                const SizedBox(width: fabWidth),
                Expanded(
                  child: _buildNavItem(context, 2, Icons.query_stats_rounded),
                ),
                Expanded(
                  child: _buildNavItem(context, 3, Icons.person_rounded),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    bool isActive = currentIndex == index;

    // Extreme contrast icon colors
    const activeColor = AppColors.primary;
    final inactiveColor = isDark
        ? Colors.white.withValues(alpha: 0.3)
        : Colors.black.withValues(alpha: 0.4);

    return BouncyButton(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isActive)
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      activeColor.withValues(alpha: 0.15),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            AnimatedScale(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOutCubic,
              scale: isActive ? 1.25 : 1.0,
              child: Icon(
                icon,
                color: isActive ? activeColor : inactiveColor,
                size: 26,
                shadows: isActive
                    ? [
                        Shadow(
                          color: activeColor.withValues(alpha: 0.4),
                          blurRadius: 15, // Solid glow for high contrast
                        )
                      ]
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
