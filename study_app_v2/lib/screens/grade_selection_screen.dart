import 'package:flutter/material.dart';
import 'package:study_app/theme/app_theme.dart';
import 'package:study_app/widgets/premium_effects.dart';
import '../utils/sacred_styles.dart';

class GradeSelectionScreen extends StatefulWidget {
  const GradeSelectionScreen({super.key});

  @override
  State<GradeSelectionScreen> createState() => _GradeSelectionScreenState();
}

class _GradeSelectionScreenState extends State<GradeSelectionScreen> {
  int _selectedGrade = 11;
  final List<int> _grades = [8, 9, 10, 11, 12];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          const Positioned.fill(child: GrainyTextureOverlay(opacity: 0.02)),
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: BouncyButton(
                    onTap: () => Navigator.pop(context),
                    child: PremiumGlassContainer(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 44,
                        height: 44,
                        alignment: Alignment.center,
                        child: Icon(Icons.arrow_back_ios_new_rounded,
                            color: theme.colorScheme.onSurface, size: 18),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GRADE',
                        style: SacredStyles.withColor(
                          SacredStyles.mono14Bold.copyWith(letterSpacing: 4.0),
                          AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Select Level',
                        style: SacredStyles.withColor(
                          SacredStyles.display32Bold
                              .copyWith(fontSize: 56, letterSpacing: -2.0),
                          theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Personalize your study experience by choosing your current academic grade.',
                        style: SacredStyles.withColor(
                          SacredStyles.inter16,
                          isDark
                              ? AppColors.textSecondary
                              : AppColors.textSecondaryLight,
                        ).copyWith(height: 1.5),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 300,
                  child: ListWheelScrollView(
                    itemExtent: 110,
                    perspective: 0.004,
                    diameterRatio: 1.8,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() => _selectedGrade = _grades[index]);
                    },
                    children: _grades.map((grade) {
                      bool isSelected = _selectedGrade == grade;
                      return BouncyButton(
                        scaleFactor: 0.98,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: isSelected ? 260 : 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : theme.colorScheme.outline
                                        .withValues(alpha: 0.5)),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                        color: AppColors.primary
                                            .withValues(alpha: 0.3),
                                        blurRadius: 24,
                                        offset: const Offset(0, 10))
                                  ]
                                : [],
                          ),
                          child: Text(
                            'GRADE $grade',
                            style: SacredStyles.withColor(
                              isSelected
                                  ? SacredStyles.inter24Bold
                                  : SacredStyles.inter18Bold,
                              isSelected
                                  ? Colors.white
                                  : (isDark
                                      ? AppColors.textSecondary
                                      : AppColors.textSecondaryLight),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: BouncyButton(
                    onTap: () => Navigator.pop(context),
                    child: PremiumGlassContainer(
                      borderRadius: BorderRadius.circular(32),
                      showShimmer: true,
                      borderColor: AppColors.primary.withValues(alpha: 0.3),
                      child: Container(
                        width: double.infinity,
                        height: 72,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.primary.withValues(alpha: 0.8),
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'CONTINUE',
                          style: SacredStyles.withColor(
                            SacredStyles.mono14Bold.copyWith(fontSize: 18),
                            Colors.white,
                          ).copyWith(letterSpacing: 2),
                        ),
                      ),
                    ),
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
