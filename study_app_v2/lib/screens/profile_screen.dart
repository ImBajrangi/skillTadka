import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/mock_data.dart';
import '../widgets/premium_effects.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'USER PROFILE',
          style: GoogleFonts.robotoMono(
            color: AppColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).textTheme.displayLarge?.color ??
                AppColors.textMain,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 1,
          color: (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.border
                  : AppColors.borderLight)
              .withValues(alpha: 0.5),
        ),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
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
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Grade 11 • Arts & Sciences',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.05)
              : AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 16),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: TextStyle(
            color:
                Theme.of(context).textTheme.titleLarge?.color ?? Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
    return PremiumGlassContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color ??
                    Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: PremiumGlassContainer(
        child: ListTile(
          leading: Icon(icon,
              color:
                  isDestructive ? Colors.redAccent : AppColors.textSecondary),
          title: Text(
            title,
            style: TextStyle(
              color: isDestructive
                  ? Colors.redAccent
                  : (Theme.of(context).textTheme.bodyLarge?.color ??
                      Colors.white),
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(Icons.chevron_right_rounded,
              color:
                  (Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white)
                      .withValues(alpha: 0.2)),
        ),
      ),
    );
  }
}
