import 'package:flutter/material.dart';
import 'package:study_app/theme/app_theme.dart';
import 'package:study_app/widgets/premium_effects.dart';

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
    return Scaffold(
      backgroundColor: AppColors.bgLight,
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
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        // Added const here
                        'Select Grade',
                        style: TextStyle(
                          // Changed to TextStyle as per instruction's implied style change
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMain,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Choose your current academic class to personalize your experience.',
                        style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 16,
                            height: 1.5),
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
                          color: isSelected ? AppColors.textMain : Colors.white,
                          borderRadius: BorderRadius.circular(32),
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
                          style: TextStyle(
                            fontSize: isSelected ? 32 : 24,
                            fontWeight: FontWeight.w900,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textSecondary,
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
                          foregroundColor: AppColors.textMain,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          elevation: 10,
                          shadowColor: AppColors.primary.withValues(alpha: 0.5),
                        ),
                        child: const Text('CONTINUE',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2)),
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
