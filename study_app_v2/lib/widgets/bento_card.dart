import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/sacred_styles.dart';

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

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        constraints: BoxConstraints(
          minHeight: height ?? 0,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
          border: Border.all(
            color: theme.colorScheme.outline,
          ),
          boxShadow: isGlow ? AppColors.emeraldGlow : AppColors.cardShadow,
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Subtle Grid Pattern or Gradient
            Positioned(
              right: -10,
              top: -10,
              child: Icon(
                icon,
                size: 80,
                color:
                    (accentColor ?? AppColors.primary).withValues(alpha: 0.05),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: (accentColor ?? AppColors.primary)
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: accentColor ?? AppColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: SacredStyles.withColor(
                      SacredStyles.mono14Bold,
                      theme.colorScheme.onSurface,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: SacredStyles.withColor(
                        SacredStyles.inter10Bold
                            .copyWith(fontWeight: FontWeight.w500),
                        isDark
                            ? AppColors.textSecondary
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                  if (child != null) ...[
                    const SizedBox(height: 8),
                    child!,
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
