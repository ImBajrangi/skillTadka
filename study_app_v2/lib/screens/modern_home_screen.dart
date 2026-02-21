import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_prefs_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/bento_card.dart';
import '../utils/mock_data.dart';

class ModernHomeScreen extends ConsumerWidget {
  const ModernHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, ref),
            const SizedBox(height: 40),
            _buildStatusBento(context),
            const SizedBox(height: 32),
            _buildSectionHeader(context, 'Today\'s Focus'),
            const SizedBox(height: 20),
            _buildSubjectsBento(context),
            const SizedBox(height: 32),
            _buildSectionHeader(context, 'Daily Assignments'),
            const SizedBox(height: 20),
            _buildAssignmentsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
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
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.border
                      : AppColors.borderLight,
                ),
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
                      style: GoogleFonts.robotoMono(
                        color: Theme.of(context).textTheme.bodyLarge?.color ??
                            AppColors.textMain,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                Text(
                  'GRADE 11 • SCIENCE STREAM',
                  style: GoogleFonts.robotoMono(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildHeaderAction(
              context,
              ref.watch(userPrefsProvider).themeMode == ThemeMode.dark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
              onTap: () =>
                  ref.read(userPrefsProvider.notifier).toggleThemeMode(),
            ),
            const SizedBox(width: 8),
            _buildHeaderAction(context, Icons.search_rounded),
            const SizedBox(width: 8),
            _buildHeaderAction(context, Icons.notifications_none_rounded),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderAction(BuildContext context, IconData icon,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.border
                : AppColors.borderLight,
          ),
        ),
        child: Icon(icon, color: AppColors.textSecondary, size: 20),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: GoogleFonts.robotoMono(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const Icon(Icons.tune_rounded,
                color: AppColors.textSecondary, size: 18),
          ],
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

  Widget _buildStatusBento(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 45,
          child: BentoCard(
            title: '${MockData.userStreak} Days',
            subtitle: 'Current Streak',
            icon: Icons.local_fire_department_rounded,
            accentColor: Colors.orange,
            height: 140,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 55,
          child: BentoCard(
            title: MockData.userXP.toString().replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => '${m[1]},'),
            subtitle: 'Total XP Earned',
            icon: Icons.bolt_rounded,
            accentColor: AppColors.primary,
            height: 140,
            isGlow: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: MockData.dailyGoalProgress,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectsBento(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BentoCard(
            title: MockData.subjects[0]['name'] as String,
            subtitle: 'Unit 4: Mechanics',
            icon: MockData.subjects[0]['icon'] as IconData,
            accentColor: MockData.subjects[0]['color'] as Color,
            height: 180,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              BentoCard(
                title: MockData.subjects[1]['name'] as String,
                icon: MockData.subjects[1]['icon'] as IconData,
                accentColor: MockData.subjects[1]['color'] as Color,
                height: 82,
              ),
              const SizedBox(height: 16),
              BentoCard(
                title: MockData.subjects[2]['name'] as String,
                icon: MockData.subjects[2]['icon'] as IconData,
                accentColor: MockData.subjects[2]['color'] as Color,
                height: 82,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAssignmentsList(BuildContext context) {
    return Column(
      children: [
        _buildAssignmentItem(context, 'Maths Quiz', 'Due tomorrow',
            Icons.quiz_rounded, Colors.purple),
        const SizedBox(height: 12),
        _buildAssignmentItem(context, 'Physics Lab', 'Due in 3 days',
            Icons.biotech_rounded, Colors.blue),
      ],
    );
  }

  Widget _buildAssignmentItem(BuildContext context, String title, String due,
      IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color ??
                            AppColors.textMain,
                        fontWeight: FontWeight.bold)),
                Text(due,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color ??
                            AppColors.textSecondary,
                        fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded,
              color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
