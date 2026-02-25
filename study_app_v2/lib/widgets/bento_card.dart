import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/sacred_styles.dart';
import 'premium_effects.dart';

class BentoCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? accentColor;
  final Widget? child;
  final double? width;
  final double? height;
  final bool isGlow;
  final VoidCallback? onTap;

  const BentoCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.accentColor,
    this.child,
    this.width,
    this.height,
    this.isGlow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final effectiveColor = accentColor ?? AppColors.primary;

    // Theme-aware content color
    final contentColor = isDark ? Colors.white : theme.colorScheme.onSurface;
    final iconColor = isDark ? Colors.white : effectiveColor;

    return BouncyButton(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: PremiumGlassContainer(
          showShimmer: isGlow,
          useBlur: isGlow, // ONLY blur the hero/special cards
          borderColor: isGlow ? effectiveColor.withValues(alpha: 0.4) : null,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              effectiveColor.withValues(alpha: isDark ? 0.25 : 0.15),
              effectiveColor.withValues(alpha: isDark ? 0.10 : 0.05),
            ],
          ),
          boxShadow: isGlow
              ? [
                  BoxShadow(
                    color:
                        effectiveColor.withValues(alpha: isDark ? 0.3 : 0.15),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  )
                ]
              : [],
          child: LayoutBuilder(
            builder: (context, constraints) {
              final h = constraints.maxHeight;

              // 3-Tier Scaling System with refined thresholds for "Attractive" density
              final isHero = h >= 180;
              final isCompact = h < 180 && h >= 120;
              final isTiny = h < 120;

              // Padding
              final padding = isTiny ? 14.0 : (isCompact ? 16.0 : 20.0);

              // Icon configuration
              final iconBgSize = isTiny ? 32.0 : (isCompact ? 36.0 : 44.0);
              final iconSize = isTiny ? 18.0 : (isCompact ? 20.0 : 24.0);

              // Spacing configuration
              final mainSpacing = isTiny ? 8.0 : (isCompact ? 10.0 : 14.0);
              final subSpacing = isTiny ? 2.0 : (isCompact ? 4.0 : 6.0);
              final childSpacing = isTiny ? 6.0 : (isCompact ? 8.0 : 12.0);

              // Typography
              TextStyle titleStyle = isTiny
                  ? SacredStyles.inter12Bold
                  : (isCompact
                      ? SacredStyles.inter14Bold
                      : SacredStyles.inter16Bold);
              TextStyle subStyle = isTiny
                  ? SacredStyles.inter10
                  : (isCompact
                      ? SacredStyles.inter12.copyWith(fontSize: 10)
                      : SacredStyles.inter12);

              return ClipRRect(
                borderRadius: BorderRadius.circular(AppTheme.borderRadius),
                child: Stack(
                  children: [
                    // Background Watermark
                    Positioned(
                      right: isTiny ? -5 : (isCompact ? -10 : -15),
                      bottom: isTiny ? -5 : (isCompact ? -10 : -15),
                      child: Icon(
                        icon,
                        size: isTiny ? 85 : (isCompact ? 110 : 160),
                        color: effectiveColor.withValues(
                            alpha: isDark ? 0.08 : 0.12),
                      ),
                    ),

                    // Content
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: isHero
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        children: [
                          // Icon Badge
                          Container(
                            width: iconBgSize,
                            height: iconBgSize,
                            decoration: BoxDecoration(
                              color: effectiveColor.withValues(
                                  alpha: isDark ? 0.2 : 0.1),
                              borderRadius:
                                  BorderRadius.circular(isTiny ? 8 : 12),
                              border: Border.all(
                                color: effectiveColor.withValues(
                                    alpha: isDark ? 0.4 : 0.2),
                                width: 1.5,
                              ),
                            ),
                            child: Icon(
                              icon,
                              color: iconColor,
                              size: iconSize,
                            ),
                          ),

                          if (isHero) const Spacer(),
                          SizedBox(height: isHero ? 0 : mainSpacing),

                          // Title
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: isDark
                                ? SacredStyles.withShadow(
                                    SacredStyles.withColor(
                                        titleStyle, contentColor),
                                  )
                                : SacredStyles.withColor(
                                    titleStyle, contentColor),
                          ),

                          // Subtitle
                          if (subtitle != null) ...[
                            SizedBox(height: subSpacing),
                            Text(
                              subtitle!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: SacredStyles.withColor(
                                subStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2,
                                ),
                                contentColor.withValues(alpha: 0.8),
                              ),
                            ),
                          ],

                          // Action/Progress/Child
                          if (child != null) ...[
                            SizedBox(height: childSpacing),
                            Flexible(child: child!),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
