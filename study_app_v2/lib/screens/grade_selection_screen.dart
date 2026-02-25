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
          const GrainyTextureOverlay(opacity: 0.03),
          // Background decorative spheres
          Positioned(
            top: 100,
            left: -50,
            child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle)),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: theme.colorScheme.onSurface),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Grade',
                        style: SacredStyles.withColor(
                          SacredStyles.display32Bold.copyWith(
                              fontSize: 48, fontWeight: FontWeight.bold),
                          theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Choose your current academic class to personalize your experience.',
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
                  height: 350,
                  child: ListWheelScrollView(
                    itemExtent: 100,
                    perspective: 0.005,
                    diameterRatio: 2.0,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() => _selectedGrade = _grades[index]);
                    },
                    children: _grades.map((grade) {
                      bool isSelected = _selectedGrade == grade;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isSelected ? 240 : 180,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? theme.colorScheme.onSurface
                              : theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                              color: isSelected
                                  ? Colors.transparent
                                  : theme.colorScheme.outline),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 20,
                                      offset: const Offset(0, 10))
                                ]
                              : [],
                        ),
                        child: Text(
                          'Grade $grade',
                          style: SacredStyles.withColor(
                            isSelected
                                ? SacredStyles.display32Bold
                                    .copyWith(fontSize: 32)
                                : SacredStyles.headline24SemiBold,
                            isSelected
                                ? AppColors.primary
                                : (isDark
                                    ? AppColors.textSecondary
                                    : AppColors.textSecondaryLight),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: PremiumShineEffect(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          elevation: 10,
                          shadowColor: AppColors.primary.withValues(alpha: 0.5),
                        ),
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
