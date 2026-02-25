import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_prefs_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/bento_card.dart';
import '../widgets/premium_effects.dart';
import '../widgets/premium_search_bar.dart';
import 'achievement_profile_screen.dart';
import 'content_details_screen.dart';
import '../utils/mock_data.dart';
import '../utils/sacred_styles.dart';

class ModernHomeScreen extends ConsumerStatefulWidget {
  const ModernHomeScreen({super.key});

  @override
  ConsumerState<ModernHomeScreen> createState() => _ModernHomeScreenState();
}

class _ModernHomeScreenState extends ConsumerState<ModernHomeScreen> {
  // Local state to track which subject is in the "Hero" position
  // Indices represent [Hero, Sub1, Sub2]
  final List<int> _subjectIndices = [0, 1, 2];

  void _swapHero(int clickedPosition) {
    if (clickedPosition == 0) return; // Already hero

    setState(() {
      final heroIndex = _subjectIndices[0];
      _subjectIndices[0] = _subjectIndices[clickedPosition];
      _subjectIndices[clickedPosition] = heroIndex;
    });
  }

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
            _buildHeader(context, ref),
            const SizedBox(height: 32),
            PremiumSearchBar(
              onChanged: (val) {},
              onFilterTap: () {},
            ),
            const SizedBox(height: 32),
            _buildStatusBento(context),
            const SizedBox(height: 40),
            _buildSectionHeader(context, 'Today\'s Focus'),
            const SizedBox(height: 24),
            _buildSubjectsBento(context),
            const SizedBox(height: 40),
            _buildSectionHeader(context, 'Daily Assignments'),
            const SizedBox(height: 24),
            _buildAssignmentsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BouncyButton(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AchievementProfileScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    width: 2,
                  ),
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
                  'ALEX',
                  style: SacredStyles.withColor(
                    SacredStyles.mono14Bold.copyWith(letterSpacing: 2.0),
                    theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  'GRADE 11 • SCIENCE STREAM',
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
            _buildHeaderAction(
              context,
              ref.watch(userPrefsProvider).themeMode == ThemeMode.dark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
              onTap: () =>
                  ref.read(userPrefsProvider.notifier).toggleThemeMode(),
            ),
            const SizedBox(width: 10),
            _buildHeaderAction(
              context,
              Icons.notifications_none_rounded,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No new notifications'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderAction(BuildContext context, IconData icon,
      {VoidCallback? onTap}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BouncyButton(
      onTap: onTap,
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
            color: isDark
                ? AppColors.textSecondary
                : theme.colorScheme.onSurface.withValues(alpha: 0.7),
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
              title.toUpperCase(),
              style: SacredStyles.withColor(
                SacredStyles.mono12Bold.copyWith(letterSpacing: 1.5),
                isDark
                    ? AppColors.textSecondary
                    : theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: isDark
                  ? AppColors.textSecondary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.6),
              size: 14,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Divider(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
      ],
    );
  }

  Widget _buildStatusBento(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 45,
          child: BentoCard(
            title: '${MockData.userStreak} Days',
            subtitle: 'Current Streak',
            icon: Icons.local_fire_department_rounded,
            accentColor: Colors.orange,
            height: 150,
            isGlow: true,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 55,
          child: BentoCard(
            title: 'XP EARNED',
            subtitle: MockData.userXP.toString().replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => '${m[1]},'),
            icon: Icons.bolt_rounded,
            accentColor: AppColors.primary,
            height: 150,
            isGlow: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: LinearProgressIndicator(
                    value: MockData.dailyGoalProgress,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                    valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                    minHeight: 8,
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
    return SizedBox(
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Hero Position
          Expanded(
            flex: 50,
            child: _buildMorphingCard(0),
          ),
          const SizedBox(width: 12),
          // Secondary Positions
          Expanded(
            flex: 50,
            child: Column(
              children: [
                Expanded(child: _buildMorphingCard(1)),
                const SizedBox(height: 12),
                Expanded(child: _buildMorphingCard(2)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMorphingCard(int position) {
    final index = _subjectIndices[position];
    final subject = MockData.subjects[index];
    final isHero = position == 0;

    return RepaintBoundary(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeOutBack,
        switchOutCurve: Curves.easeIn,
        layoutBuilder: (child, previousChildren) => Stack(
          children: [
            ...previousChildren,
            if (child != null) child,
          ],
        ),
        child: BentoCard(
          key: ValueKey(
              'subject_${subject['name']}'), // Key forces morphing on swap
          title: subject['name'] as String,
          subtitle: isHero
              ? 'Unit 4: Mechanics'
              : (position == 1 ? '7/12 Chapters' : 'Next Quiz: Mon'),
          icon: subject['icon'] as IconData,
          accentColor: subject['color'] as Color,
          isGlow: isHero,
          onTap: () => _swapHero(position),
          child: isHero ? _buildHeroAction(subject['name'] as String) : null,
        ),
      ),
    );
  }

  Widget _buildHeroAction(String title) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final contentColor = isDark ? Colors.white : theme.colorScheme.onSurface;

    return BouncyButton(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ContentDetailsScreen(
              title: title,
              subject: title.split(' ').first,
            ),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.15)
              : theme.colorScheme.onSurface.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'CONTINUE',
              style: SacredStyles.withColor(
                SacredStyles.inter10Bold,
                contentColor,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.arrow_forward_rounded, color: contentColor, size: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentsList(BuildContext context) {
    return Column(
      children: [
        _buildAssignmentItem(context, 'Maths Quiz', 'Due tomorrow',
            Icons.quiz_rounded, Colors.purple),
        const SizedBox(height: 16),
        _buildAssignmentItem(context, 'Physics Lab', 'Due in 3 days',
            Icons.biotech_rounded, Colors.blue),
      ],
    );
  }

  Widget _buildAssignmentItem(BuildContext context, String title, String due,
      IconData icon, Color color) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BouncyButton(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ContentDetailsScreen(
              title: title,
              subject: title.split(' ').first,
            ),
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
              const SizedBox(width: 16),
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
                      due,
                      style: SacredStyles.withColor(
                        SacredStyles.inter12,
                        isDark
                            ? AppColors.textSecondary
                            : theme.colorScheme.onSurface
                                .withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: isDark
                    ? AppColors.textSecondary
                    : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
