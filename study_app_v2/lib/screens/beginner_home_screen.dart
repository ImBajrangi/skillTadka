import 'package:flutter/material.dart';
import 'package:study_app/screens/grade_selection_screen.dart';
import 'package:study_app/theme/app_theme.dart';
import '../utils/sacred_styles.dart';

class BeginnerHomeScreen extends StatelessWidget {
  const BeginnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(context),
              _buildHeader(context),
              _buildStreakCard(context),
              _buildTodayFocus(context),
              _buildExamPrep(context),
              _buildRecentPDFs(context),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 56,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: theme.colorScheme.outline),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFFC7C7C7)),
                  const SizedBox(width: 12),
                  Text(
                    'Search resources...',
                    style: SacredStyles.withColor(
                      SacredStyles.inter16,
                      const Color(0xFFC7C7C7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isDark ? theme.colorScheme.primary : AppColors.textMain,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.tune,
              color: isDark ? Colors.black : Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const GradeSelectionScreen())),
            child: Text(
              'GRADE 11 • SCIENCE STREAM',
              style: SacredStyles.withColor(
                SacredStyles.mono10Bold,
                AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: SacredStyles.display32Bold.copyWith(
                fontSize: 64,
                height: 0.85,
                letterSpacing: -3,
                color: theme.colorScheme.onSurface,
              ),
              children: const [
                TextSpan(text: 'Keep\n'),
                TextSpan(
                    text: 'Growing\n',
                    style: TextStyle(color: Color(0xFFD1D5DB))),
                TextSpan(text: 'Alex'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStreakCard(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: isDark ? theme.colorScheme.surface : const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          const Text('🔥', style: TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '14 Days',
                style: SacredStyles.withColor(
                  SacredStyles.display32Bold,
                  theme.colorScheme.onSurface,
                ),
              ),
              Text(
                'Learning Streak',
                style: SacredStyles.withColor(
                  SacredStyles.mono14Bold,
                  isDark
                      ? AppColors.textSecondary
                      : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    '2,450',
                    style: SacredStyles.withColor(
                      SacredStyles.display32Bold.copyWith(fontSize: 28),
                      theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.bolt,
                      color: AppColors.accentPurple, size: 28),
                ],
              ),
              Text(
                'XP Earned',
                style: SacredStyles.withColor(
                  SacredStyles.mono14Bold,
                  isDark
                      ? AppColors.textSecondary
                      : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTodayFocus(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today\'s Focus',
                style: SacredStyles.withColor(
                  SacredStyles.headline24SemiBold,
                  theme.colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style: SacredStyles.withColor(
                    SacredStyles.mono12Bold.copyWith(fontSize: 13),
                    AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 260,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildBigFocusCard(
                context,
                'MATHEMATICS',
                'Calculus\n& Derivatives',
                '12 Notes',
                theme.colorScheme.surface,
                AppColors.accentBlue,
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  _buildSmallFocusCard(
                    context,
                    'Biology',
                    'QUIZ TODAY',
                    theme.colorScheme.surface,
                    const Color(0xFFF472B6),
                  ),
                  const SizedBox(height: 20),
                  _buildSmallFocusCard(
                    context,
                    'Physics',
                    'LIVE',
                    theme.brightness == Brightness.dark
                        ? theme.colorScheme.surface
                        : const Color(0xFFFFFBEB),
                    AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBigFocusCard(BuildContext context, String category, String title,
      String subtitle, Color bg, Color accent) {
    final theme = Theme.of(context);
    return Container(
      width: 200,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(44),
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 20,
              offset: const Offset(0, 10))
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -30,
            bottom: 10,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    accent.withValues(alpha: 0.4),
                    accent.withValues(alpha: 0.05),
                    Colors.transparent
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 40,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    accent.withValues(alpha: 0.6),
                    accent.withValues(alpha: 0.1)
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: SacredStyles.withColor(
                  SacredStyles.mono10Bold,
                  accent.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: SacredStyles.withColor(
                  SacredStyles.display32Bold
                      .copyWith(fontSize: 24, height: 1.1),
                  theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    subtitle,
                    style: SacredStyles.withColor(
                      SacredStyles.mono14Bold.copyWith(fontSize: 13),
                      AppColors.textSecondary,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: accent.withValues(alpha: 0.2),
                            blurRadius: 10)
                      ],
                    ),
                    child: Icon(Icons.arrow_forward, color: accent, size: 18),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallFocusCard(BuildContext context, String title, String status,
      Color bg, Color accent) {
    final theme = Theme.of(context);
    return Container(
      width: 180,
      height: 110,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -10,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [accent.withValues(alpha: 0.3), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    accent.withValues(alpha: 0.7),
                    accent.withValues(alpha: 0.2)
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: SacredStyles.withColor(
                  SacredStyles.headline24SemiBold.copyWith(fontSize: 20),
                  theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  if (status == 'LIVE')
                    Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle)),
                  if (status == 'LIVE') const SizedBox(width: 4),
                  Text(
                    status,
                    style: SacredStyles.withColor(
                      SacredStyles.mono10Bold,
                      accent.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExamPrep(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? theme.colorScheme.surface : const Color(0xFFF9F7FF),
        borderRadius: BorderRadius.circular(44),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exam Prep 2024',
                  style: SacredStyles.withColor(
                    SacredStyles.headline24SemiBold,
                    isDark
                        ? theme.colorScheme.onSurface
                        : const Color(0xFF2E1065),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Complete your semester revision modules',
                  style: SacredStyles.withColor(
                    SacredStyles.inter14.copyWith(fontWeight: FontWeight.bold),
                    const Color(0xFF7C3AED),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFA78BFA), Color(0xFF7C3AED)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(Icons.menu_book, color: Colors.white, size: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentPDFs(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Recent PDFs',
            style: SacredStyles.withColor(
              SacredStyles.headline24SemiBold,
              theme.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildPDFCard(context, 'History_Ch2.pdf', '2.4 MB',
                  const Color(0xFFFEF3C7), const Color(0xFFD97706)),
              _buildPDFCard(context, 'Math_Formula.pdf', '1.1 MB',
                  const Color(0xFFE0F2FE), AppColors.accentBlue),
              _buildPDFCard(context, 'Eng_Lit_Notes.pdf', '4.8 MB',
                  const Color(0xFFFDF2F2), const Color(0xFFDB2777)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPDFCard(
      BuildContext context, String name, String size, Color bg, Color accent) {
    final theme = Theme.of(context);
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: bg.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.insert_drive_file, color: accent, size: 28),
          ),
          const Spacer(),
          Text(
            name,
            style: SacredStyles.withColor(
              SacredStyles.inter12.copyWith(fontWeight: FontWeight.w900),
              theme.colorScheme.onSurface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            size,
            style: SacredStyles.withColor(
              SacredStyles.inter10Bold,
              AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
