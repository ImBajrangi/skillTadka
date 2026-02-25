import 'package:flutter/material.dart';
import 'package:study_app/theme/app_theme.dart';
import 'package:study_app/widgets/premium_effects.dart';
import '../utils/sacred_styles.dart';

class AchievementProfileScreen extends StatelessWidget {
  const AchievementProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings_outlined,
                  color: theme.colorScheme.onSurface),
              onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          const GrainyTextureOverlay(opacity: 0.04),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),
                _buildProfileHeader(context),
                const SizedBox(height: 40),
                _buildStatsBentoGrid(context),
                const SizedBox(height: 40),
                _buildAchievementsSection(context),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 4),
              ),
              padding: const EdgeInsets.all(4),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/300?u=alex'),
              ),
            ),
            Positioned(
              right: 2,
              bottom: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Alex Johnson',
          style: SacredStyles.withColor(
            SacredStyles.display32Bold
                .copyWith(fontSize: 28, fontWeight: FontWeight.w900),
            theme.colorScheme.onSurface,
          ),
        ),
        Text(
          'University Student • Grade 11',
          style: SacredStyles.withColor(
            SacredStyles.inter14.copyWith(fontWeight: FontWeight.w500),
            isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsBentoGrid(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance',
            style: SacredStyles.withColor(
              SacredStyles.headline24SemiBold
                  .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
              theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildBentoCard(context, '14 Days', 'STREAK',
                    Icons.local_fire_department, AppColors.primaryAction),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildBentoCard(context, 'Level 12', 'RANK',
                    Icons.military_tech, AppColors.accentPurple),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildBentoCardFull(
              context,
              'Active Learner',
              'You are in the top 5% of grade 11 students.',
              Icons.trending_up,
              AppColors.accentBlue),
        ],
      ),
    );
  }

  Widget _buildBentoCard(BuildContext context, String val, String label,
      IconData icon, Color accent) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 15)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accent, size: 28),
          const SizedBox(height: 16),
          Text(
            val,
            style: SacredStyles.withColor(
              SacredStyles.display32Bold
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
              theme.colorScheme.onSurface,
            ),
          ),
          Text(
            label,
            style: SacredStyles.withColor(
              SacredStyles.mono10Bold.copyWith(fontWeight: FontWeight.w900),
              isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBentoCardFull(BuildContext context, String title, String desc,
      IconData icon, Color accent) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 15)
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, color: accent, size: 28),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: SacredStyles.withColor(
                    SacredStyles.inter16.copyWith(fontWeight: FontWeight.bold),
                    theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  desc,
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
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Achievements',
            style: SacredStyles.withColor(
              SacredStyles.headline24SemiBold
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          _buildAchievementItem(
              context,
              'Elite Scholar',
              'Top 5% of students in Grade 11',
              Icons.workspace_premium,
              AppColors.primary),
          const SizedBox(height: 16),
          _buildAchievementItem(
              context,
              'Consistency King',
              'Maintained 30 day study streak',
              Icons.local_fire_department,
              AppColors.primaryAction),
          const SizedBox(height: 16),
          _buildAchievementItem(
              context,
              'Quiz Master',
              'Scored 100% in 5 consecutive quizzes',
              Icons.psychology,
              AppColors.accentBlue),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(BuildContext context, String title, String desc,
      IconData icon, Color color) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)
        ],
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
                    SacredStyles.inter16.copyWith(fontWeight: FontWeight.bold),
                    theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  desc,
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
        ],
      ),
    );
  }
}
