import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/mock_data.dart';
import '../widgets/premium_effects.dart';
import '../utils/sacred_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            _buildProfileHeader(context),
            const SizedBox(height: 48),
            _buildAchievementGrid(context),
            const SizedBox(height: 48),
            _buildSettingsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'USER PROFILE',
          style: SacredStyles.withColor(
            SacredStyles.mono12Bold.copyWith(letterSpacing: 2.0),
            AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Settings',
          style: SacredStyles.withColor(
            SacredStyles.display32Bold,
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Divider(height: 1, color: theme.colorScheme.outline),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 3),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBqUWP7HM6rEHnI5McRApJipQP5ABiMvZt7lTycq939qkZCO7NM8Aqb-aAmcIPCUpm0pib7oQMJh-xCec7v8lpVmCegcqW75UA30TXPusU062bT4alEykfyED8stqFy_Y7Chq8To4Zxt0owfMK2OWN4eKYDqr2Vm786b5CGPWn8jFPboyVUnCR2cgAsIM-11WNXF-IzViRvMVZRIfIO0DopIp_Zwkit7O8FeztCOoD-FmZfx-HxSkdIfIQBv7jp-Q_tUtg5N7GReo4'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Alex Johnson',
          style: SacredStyles.withColor(
            SacredStyles.inter24Bold,
            theme.colorScheme.onSurface,
          ),
        ),
        Text(
          'Grade 11 • Arts & Sciences',
          style: SacredStyles.withColor(
            SacredStyles.inter14.copyWith(fontWeight: FontWeight.w600),
            isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeaderBadge(context, 'Rank #12', Icons.emoji_events_rounded),
            const SizedBox(width: 12),
            _buildHeaderBadge(context, 'Level ${MockData.userLevel}',
                Icons.military_tech_rounded),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderBadge(BuildContext context, String text, IconData icon) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 16),
          const SizedBox(width: 8),
          Text(
            text,
            style: SacredStyles.withColor(
              SacredStyles.inter12.copyWith(fontWeight: FontWeight.bold),
              theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementGrid(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: SacredStyles.withColor(
            SacredStyles.inter18Bold,
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: [
            _buildAchievementTile(
                context, Icons.local_fire_department_rounded, 'Streak Master'),
            _buildAchievementTile(
                context, Icons.auto_stories_rounded, 'Bookworm'),
            _buildAchievementTile(
                context, Icons.psychology_rounded, 'Deep Work'),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementTile(
      BuildContext context, IconData icon, String label) {
    final theme = Theme.of(context);

    return PremiumGlassContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: SacredStyles.withColor(
              SacredStyles.inter10Bold,
              theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Column(
      children: [
        _buildSettingsItem(
            context, Icons.person_outline_rounded, 'Account Details'),
        _buildSettingsItem(
            context, Icons.notifications_none_rounded, 'Preferences'),
        _buildSettingsItem(context, Icons.security_rounded, 'Privacy & Safety'),
        _buildSettingsItem(context, Icons.help_outline_rounded, 'Support Hub'),
        _buildSettingsItem(context, Icons.logout_rounded, 'Logout',
            isDestructive: true),
      ],
    );
  }

  Widget _buildSettingsItem(BuildContext context, IconData icon, String title,
      {bool isDestructive = false}) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: PremiumGlassContainer(
        child: ListTile(
          leading: Icon(icon,
              color: isDestructive
                  ? Colors.redAccent
                  : (theme.brightness == Brightness.dark
                      ? AppColors.textSecondary
                      : AppColors.textSecondaryLight)),
          title: Text(
            title,
            style: SacredStyles.withColor(
              SacredStyles.inter16.copyWith(fontWeight: FontWeight.w600),
              isDestructive ? Colors.redAccent : theme.colorScheme.onSurface,
            ),
          ),
          trailing: Icon(Icons.chevron_right_rounded,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.2)),
        ),
      ),
    );
  }
}
