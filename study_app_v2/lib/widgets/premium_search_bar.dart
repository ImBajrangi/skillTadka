import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/sacred_styles.dart';
import 'premium_effects.dart';

class PremiumSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  const PremiumSearchBar({
    super.key,
    this.onChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return PremiumGlassContainer(
      borderRadius: BorderRadius.circular(16),
      blur: 15,
      opacity: isDark ? 0.12 : 0.08,
      borderColor: theme.colorScheme.outline.withValues(alpha: 0.15),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: isDark
                  ? AppColors.textSecondary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.5),
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                style: SacredStyles.withColor(
                  SacredStyles.mono12Bold,
                  theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'SEARCH CURRICULUM...',
                  hintStyle: SacredStyles.withColor(
                    SacredStyles.mono12Bold,
                    isDark
                        ? AppColors.textSecondary.withValues(alpha: 0.4)
                        : theme.colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (onFilterTap != null) ...[
              const SizedBox(width: 8),
              BouncyButton(
                onTap: onFilterTap,
                child: const Icon(
                  Icons.tune_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
