import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/sacred_styles.dart';
import '../widgets/premium_effects.dart';
import 'grade_selection_screen.dart';

class BeginnerHomeScreen extends StatelessWidget {
  const BeginnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          const Positioned.fill(child: GrainyTextureOverlay(opacity: 0.01)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(context),
                  _buildHeader(context),
                  _buildStreakCard(context),
                  const SizedBox(height: 24),
                  _buildTodayFocus(context),
                  const SizedBox(height: 32),
                  _buildExamPrep(context),
                  const SizedBox(height: 32),
                  _buildRecentPDFs(context),
                ],
              ),
            ),
          ),
        ],
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
            child: BouncyButton(
              onTap: () {},
              child: PremiumGlassContainer(
                borderRadius: BorderRadius.circular(28),
                blur: 10,
                opacity: 0.05,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Icon(Icons.search_rounded,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.4),
                          size: 22),
                      const SizedBox(width: 12),
                      Text(
                        'Search resources...',
                        style: SacredStyles.withColor(
                          SacredStyles.inter16,
                          theme.colorScheme.onSurface.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          BouncyButton(
            onTap: () {},
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isDark ? theme.colorScheme.primary : AppColors.textMain,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (isDark
                            ? theme.colorScheme.primary
                            : AppColors.textMain)
                        .withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.tune_rounded,
                color: isDark ? Colors.black : Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BouncyButton(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const GradeSelectionScreen())),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'GRADE 11 • SCIENCE STREAM',
                  style: SacredStyles.withColor(
                    SacredStyles.mono10Bold.copyWith(letterSpacing: 2.0),
                    AppColors.primary,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primary, size: 16),
              ],
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: SacredStyles.display32Bold.copyWith(
                fontSize: 56,
                height: 0.9,
                letterSpacing: -2,
                color: theme.colorScheme.onSurface,
              ),
              children: const [
                TextSpan(text: 'Keep\n'),
                TextSpan(
                    text: 'Growing\n',
                    style: TextStyle(color: Color(0xFF94A3B8))),
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

    return BouncyButton(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: PremiumGlassContainer(
          borderRadius: BorderRadius.circular(36),
          showShimmer: true,
          borderColor: AppColors.primary.withValues(alpha: 0.2),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Text('🔥', style: TextStyle(fontSize: 28)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '14 Days',
                        style: SacredStyles.withColor(
                          SacredStyles.inter24Bold,
                          theme.colorScheme.onSurface,
                        ).copyWith(letterSpacing: -1),
                      ),
                      Text(
                        'LEARNING STREAK',
                        style: SacredStyles.withColor(
                          SacredStyles.mono10Bold.copyWith(letterSpacing: 1.0),
                          isDark
                              ? AppColors.textSecondary
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2,450',
                          style: SacredStyles.withColor(
                            SacredStyles.inter20Bold,
                            theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.bolt_rounded,
                            color: Colors.amber, size: 24),
                      ],
                    ),
                    Text(
                      'XP TOTAL',
                      style: SacredStyles.withColor(
                        SacredStyles.mono10Bold.copyWith(letterSpacing: 1.0),
                        isDark
                            ? AppColors.textSecondary
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
                'TODAY\'S FOCUS',
                style: SacredStyles.withColor(
                  SacredStyles.mono12Bold.copyWith(letterSpacing: 1.5),
                  theme.colorScheme.onSurface,
                ),
              ),
              BouncyButton(
                onTap: () {},
                child: Text(
                  'VIEW ALL',
                  style: SacredStyles.withColor(
                    SacredStyles.mono10Bold.copyWith(letterSpacing: 1.0),
                    AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            physics: const BouncingScrollPhysics(),
            children: [
              _buildBigFocusCard(
                context,
                'MATHEMATICS',
                'Calculus\n& Derivatives',
                '12 NOTES',
                AppColors.accentBlue,
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  _buildSmallFocusCard(
                    context,
                    'Biology',
                    'QUIZ TODAY',
                    const Color(0xFFF472B6),
                  ),
                  const SizedBox(height: 16),
                  _buildSmallFocusCard(
                    context,
                    'Physics',
                    'LIVE NOW',
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
      String subtitle, Color accent) {
    final theme = Theme.of(context);
    return BouncyButton(
      onTap: () {},
      child: PremiumGlassContainer(
        borderRadius: BorderRadius.circular(40),
        borderColor: accent.withValues(alpha: 0.3),
        child: Container(
          width: 210,
          padding: const EdgeInsets.all(28),
          child: Stack(
            children: [
              Positioned(
                right: -40,
                bottom: -40,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        accent.withValues(alpha: 0.2),
                        Colors.transparent
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
                      SacredStyles.mono10Bold.copyWith(letterSpacing: 2.0),
                      accent,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: SacredStyles.withColor(
                      SacredStyles.inter24Bold
                          .copyWith(height: 1.1, letterSpacing: -0.5),
                      theme.colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        subtitle,
                        style: SacredStyles.withColor(
                          SacredStyles.mono10Bold.copyWith(letterSpacing: 1.0),
                          theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: accent.withValues(alpha: 0.2)),
                        ),
                        child: Icon(Icons.arrow_forward_rounded,
                            color: accent, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallFocusCard(
      BuildContext context, String title, String status, Color accent) {
    final theme = Theme.of(context);
    return BouncyButton(
      onTap: () {},
      child: PremiumGlassContainer(
        borderRadius: BorderRadius.circular(32),
        borderColor: accent.withValues(alpha: 0.2),
        child: Container(
          width: 190,
          height: 124,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: SacredStyles.withColor(
                  SacredStyles.inter18Bold,
                  theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: accent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: accent.withValues(alpha: 0.5),
                            blurRadius: 4),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    status,
                    style: SacredStyles.withColor(
                      SacredStyles.mono10Bold.copyWith(letterSpacing: 0.5),
                      accent.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamPrep(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BouncyButton(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: PremiumGlassContainer(
          borderRadius: BorderRadius.circular(44),
          showShimmer: true,
          borderColor: const Color(0xFF7C3AED).withValues(alpha: 0.2),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EXAM PREP 2024',
                        style: SacredStyles.withColor(
                          SacredStyles.mono12Bold.copyWith(letterSpacing: 2.0),
                          const Color(0xFF7C3AED),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Complete your revision modules before semester starts.',
                        style: SacredStyles.withColor(
                          SacredStyles.inter14,
                          isDark ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFA78BFA), Color(0xFF7C3AED)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.school_rounded,
                      color: Colors.white, size: 28),
                ),
              ],
            ),
          ),
        ),
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
            'RECENT RESOURCES',
            style: SacredStyles.withColor(
              SacredStyles.mono12Bold.copyWith(letterSpacing: 1.5),
              theme.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            physics: const BouncingScrollPhysics(),
            children: [
              _buildPDFCard(context, 'History_Ch2.pdf', '2.4 MB', Colors.amber),
              _buildPDFCard(context, 'Math_Formula.pdf', '1.1 MB', Colors.blue),
              _buildPDFCard(
                  context, 'Eng_Lit_Notes.pdf', '4.8 MB', Colors.pink),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPDFCard(
      BuildContext context, String name, String size, Color accent) {
    final theme = Theme.of(context);
    return BouncyButton(
      onTap: () {},
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(right: 16),
        child: PremiumGlassContainer(
          borderRadius: BorderRadius.circular(32),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.insert_drive_file_rounded,
                      color: accent, size: 26),
                ),
                const Spacer(),
                Text(
                  name,
                  style: SacredStyles.withColor(
                    SacredStyles.inter12.copyWith(fontWeight: FontWeight.bold),
                    theme.colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  size.toUpperCase(),
                  style: SacredStyles.withColor(
                    SacredStyles.mono10Bold,
                    AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
