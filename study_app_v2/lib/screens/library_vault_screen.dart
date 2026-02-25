import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bento_card.dart';
import '../widgets/premium_effects.dart';
import '../utils/mock_data.dart';
import '../utils/sacred_styles.dart';
import 'resource_detail_screen.dart';

class LibraryVaultScreen extends StatelessWidget {
  const LibraryVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, topPadding + 80, 24, 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 48),
            _buildSectionHeader(context, 'QUICK ACCESS'),
            const SizedBox(height: 24),
            _buildQuickAccessBento(),
            const SizedBox(height: 48),
            _buildSectionHeader(context, 'ALL CATEGORIES'),
            const SizedBox(height: 24),
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
            BouncyButton(
              onTap: () {},
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      width: 2),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuBqUWP7HM6rEHnI5McRApJipQP5ABiMvZt7lTycq939qkZCO7NM8Aqb-aAmcIPCUpm0pib7oQMJh-xCec7v8lpVmCegcqW75UA30TXPusU062bT4alEykfyED8stqFy_Y7Chq8To4Zxt0owfMK2OWN4eKYDqr2Vm786b5CGPWn8jFPboyVUnCR2cgAsIM-11WNXF-IzViRvMVZRIfIO0DopIp_Zwkit7O8FeztCOoD-FmZfx-HxSkdIfIQBv7jp-Q_tUtg5N7GReo4'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THE VAULT',
                  style: SacredStyles.withColor(
                    SacredStyles.mono14Bold.copyWith(letterSpacing: 2.0),
                    theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  'ALEX J. • GRADE 11',
                  style: SacredStyles.withColor(
                    SacredStyles.mono10Bold.copyWith(letterSpacing: 0.5),
                    isDark
                        ? AppColors.textSecondary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildHeaderAction(context, Icons.search_rounded),
            const SizedBox(width: 10),
            _buildHeaderAction(context, Icons.filter_list_rounded),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderAction(BuildContext context, IconData icon) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BouncyButton(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Search placeholder triggered'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: PremiumGlassContainer(
        borderRadius: BorderRadius.circular(12),
        blur: 10,
        opacity: 0.1,
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color:
                isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
            size: 22,
          ),
        ),
      ),
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
              title,
              style: SacredStyles.withColor(
                SacredStyles.mono12Bold.copyWith(letterSpacing: 1.5),
                isDark
                    ? AppColors.textSecondary
                    : theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            Icon(Icons.auto_awesome_mosaic_rounded,
                color: isDark
                    ? AppColors.textSecondary
                    : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                size: 14),
          ],
        ),
        const SizedBox(height: 12),
        Divider(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
      ],
    );
  }

  Widget _buildQuickAccessBento() {
    return const Row(
      children: [
        Expanded(
          child: BentoCard(
            title: 'Downloads',
            subtitle: '12 FILES',
            icon: Icons.download_for_offline_rounded,
            accentColor: AppColors.primary,
            height: 140,
            isGlow: true,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: BentoCard(
            title: 'Saved',
            subtitle: '45 ITEMS',
            icon: Icons.bookmark_rounded,
            accentColor: Colors.purple,
            height: 140,
            isGlow: true,
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
                '${cat['count']} Resources',
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
      child: BouncyButton(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const ResourceDetailScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        child: PremiumGlassContainer(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: color.withValues(alpha: 0.2)),
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
                              .copyWith(fontWeight: FontWeight.bold),
                          theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        count.toUpperCase(),
                        style: SacredStyles.withColor(
                          SacredStyles.mono10Bold,
                          isDark
                              ? AppColors.textSecondary
                              : theme.colorScheme.onSurface
                                  .withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: isDark
                        ? AppColors.textSecondary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.6)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
