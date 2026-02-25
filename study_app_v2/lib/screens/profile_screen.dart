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
          'USER ACCOUNT',
          style: SacredStyles.withColor(
            SacredStyles.mono12Bold.copyWith(letterSpacing: 2.0),
            AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Settings',
          style: SacredStyles.withColor(
            SacredStyles.display32Bold.copyWith(letterSpacing: -1.0),
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Divider(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Column(
        children: [
          BouncyButton(
            onTap: () {},
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.5), width: 4),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 30,
                  )
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBqUWP7HM6rEHnI5McRApJipQP5ABiMvZt7lTycq939qkZCO7NM8Aqb-aAmcIPCUpm0pib7oQMJh-xCec7v8lpVmCegcqW75UA30TXPusU062bT4alEykfyED8stqFy_Y7Chq8To4Zxt0owfMK2OWN4eKYDqr2Vm786b5CGPWn8jFPboyVUnCR2cgAsIM-11WNXF-IzViRvMVZRIfIO0DopIp_Zwkit7O8FeztCOoD-FmZfx-HxSkdIfIQBv7jp-Q_tUtg5N7GReo4'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Alex Johnson',
            style: SacredStyles.withColor(
              SacredStyles.inter24Bold,
              theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'GRADE 11 • ARTS & SCIENCES',
            style: SacredStyles.withColor(
              SacredStyles.mono10Bold.copyWith(letterSpacing: 1.0),
              isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeaderBadge(context, 'RANK #12', Icons.emoji_events_rounded,
                  Colors.orange),
              const SizedBox(width: 12),
              _buildHeaderBadge(context, 'LV. ${MockData.userLevel}',
                  Icons.military_tech_rounded, AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBadge(
      BuildContext context, String text, IconData icon, Color color) {
    final theme = Theme.of(context);

    return BouncyButton(
      onTap: () {},
      child: PremiumGlassContainer(
        borderRadius: BorderRadius.circular(100),
        borderColor: color.withValues(alpha: 0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 8),
              Text(
                text,
                style: SacredStyles.withColor(
                  SacredStyles.mono10Bold.copyWith(letterSpacing: 0.5),
                  theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementGrid(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MILESTONES',
          style: SacredStyles.withColor(
            SacredStyles.mono12Bold.copyWith(letterSpacing: 1.5),
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9, // Adjust ratio to prevent squashing
          children: [
            _buildAchievementTile(context, Icons.local_fire_department_rounded,
                'STREAK\nMASTER', Colors.orange),
            _buildAchievementTile(
                context, Icons.auto_stories_rounded, 'BOOKWORM', Colors.blue),
            _buildAchievementTile(
                context, Icons.psychology_rounded, 'DEEP WORK', Colors.purple),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementTile(
      BuildContext context, IconData icon, String label, Color color) {
    final theme = Theme.of(context);

    return BouncyButton(
      onTap: () {},
      child: PremiumGlassContainer(
        borderRadius: BorderRadius.circular(24),
        borderColor: color.withValues(alpha: 0.2),
        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center, // Ensure absolute centering
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: SacredStyles.withColor(
                  SacredStyles.mono10Bold,
                  theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
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
      margin: const EdgeInsets.only(bottom: 16),
      child: BouncyButton(
        onTap: () {},
        child: PremiumGlassContainer(
          borderRadius: BorderRadius.circular(24),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (isDestructive ? Colors.redAccent : AppColors.primary)
                    .withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon,
                  size: 20,
                  color: isDestructive
                      ? Colors.redAccent
                      : (theme.brightness == Brightness.dark
                          ? AppColors.primary
                          : AppColors.primaryAction)),
            ),
            title: Text(
              title,
              style: SacredStyles.withColor(
                SacredStyles.inter16.copyWith(fontWeight: FontWeight.bold),
                isDestructive ? Colors.redAccent : theme.colorScheme.onSurface,
              ),
            ),
            trailing: Icon(Icons.chevron_right_rounded,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3)),
          ),
        ),
      ),
    );
  }
}
