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
      backgroundColor: AppColors.bgDark,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 40),
            _buildProfileHeader(),
            const SizedBox(height: 48),
            _buildAchievementGrid(),
            const SizedBox(height: 48),
            _buildSettingsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
        const Text(
          'Settings',
          style: TextStyle(
            color: AppColors.textMain,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 1,
          color: AppColors.border.withValues(alpha: 0.5),
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
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
        const Text(
          'Alex Johnson',
          style: TextStyle(
            color: Colors.white,
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
            _buildHeaderBadge('Rank #12', Icons.emoji_events_rounded),
            const SizedBox(width: 12),
            _buildHeaderBadge(
                'Level ${MockData.userLevel}', Icons.military_tech_rounded),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderBadge(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 16),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Achievements',
          style: TextStyle(
            color: Colors.white,
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
                Icons.local_fire_department_rounded, 'Streak Master'),
            _buildAchievementTile(Icons.auto_stories_rounded, 'Bookworm'),
            _buildAchievementTile(Icons.psychology_rounded, 'Deep Work'),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementTile(IconData icon, String label) {
    return PremiumGlassContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return Column(
      children: [
        _buildSettingsItem(Icons.person_outline_rounded, 'Account Details'),
        _buildSettingsItem(Icons.notifications_none_rounded, 'Preferences'),
        _buildSettingsItem(Icons.security_rounded, 'Privacy & Safety'),
        _buildSettingsItem(Icons.help_outline_rounded, 'Support Hub'),
        _buildSettingsItem(Icons.logout_rounded, 'Logout', isDestructive: true),
      ],
    );
  }

  Widget _buildSettingsItem(IconData icon, String title,
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
              color: isDestructive ? Colors.redAccent : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(Icons.chevron_right_rounded,
              color: Colors.white.withValues(alpha: 0.2)),
        ),
      ),
    );
  }
}
