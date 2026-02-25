import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bento_card.dart';
import '../utils/mock_data.dart';
import '../utils/sacred_styles.dart';

class LibraryVaultScreen extends StatelessWidget {
  const LibraryVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 40),
            _buildSectionHeader(context, 'Quick Access'),
            const SizedBox(height: 20),
            _buildQuickAccessBento(),
            const SizedBox(height: 40),
            _buildSectionHeader(context, 'Categories'),
            const SizedBox(height: 20),
            _buildCategoriesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.colorScheme.outline),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBqUWP7HM6rEHnI5McRApJipQP5ABiMvZt7lTycq939qkZCO7NM8Aqb-aAmcIPCUpm0pib7oQMJh-xCec7v8lpVmCegcqW75UA30TXPusU062bT4alEykfyED8stqFy_Y7Chq8To4Zxt0owfMK2OWN4eKYDqr2Vm786b5CGPWn8jFPboyVUnCR2cgAsIM-11WNXF-IzViRvMVZRIfIO0DopIp_Zwkit7O8FeztCOoD-FmZfx-HxSkdIfIQBv7jp-Q_tUtg5N7GReo4'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'ALEX',
                      style: SacredStyles.withColor(
                        SacredStyles.mono14Bold,
                        theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Text(
                  'GRADE 11 • SCIENCE STREAM',
                  style: SacredStyles.withColor(
                    SacredStyles.mono10Bold,
                    isDark
                        ? AppColors.textSecondary
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildHeaderAction(context, Icons.search_rounded),
            const SizedBox(width: 8),
            _buildHeaderAction(context, Icons.notifications_none_rounded),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderAction(BuildContext context, IconData icon) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Icon(icon,
          color:
              isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
          size: 20),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: SacredStyles.withColor(
                SacredStyles.mono12Bold,
                isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
              ).copyWith(letterSpacing: 2.0),
            ),
            Icon(Icons.manage_search_rounded,
                color: isDark
                    ? AppColors.textSecondary
                    : AppColors.textSecondaryLight,
                size: 18),
          ],
        ),
        const SizedBox(height: 8),
        Divider(height: 1, color: theme.colorScheme.outline),
      ],
    );
  }

  Widget _buildQuickAccessBento() {
    return const Row(
      children: [
        Expanded(
          child: BentoCard(
            title: 'Downloads',
            subtitle: '12 Files',
            icon: Icons.download_for_offline_rounded,
            accentColor: AppColors.accentBlue,
            height: 120,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: BentoCard(
            title: 'Saved',
            subtitle: '45 Resources',
            icon: Icons.bookmark_rounded,
            accentColor: AppColors.primaryAction,
            height: 120,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesList(BuildContext context) {
    return Column(
      children: MockData.libraryCategories
          .map((cat) => _buildCategoryItem(
                context,
                cat['title'] as String,
                '${cat['count']} Materials',
                cat['icon'] as IconData,
                cat['color'] as Color,
              ))
          .toList(),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, String count,
      IconData icon, Color color) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: SacredStyles.withColor(
                    SacredStyles.inter16
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  count,
                  style: SacredStyles.withColor(
                    SacredStyles.inter12,
                    isDark
                        ? AppColors.textSecondary
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded,
              color: isDark
                  ? AppColors.textSecondary
                  : AppColors.textSecondaryLight),
        ],
      ),
    );
  }
}
