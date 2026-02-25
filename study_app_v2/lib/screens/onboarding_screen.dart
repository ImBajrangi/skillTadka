import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_theme.dart';
import '../providers/user_prefs_provider.dart';
import '../utils/sacred_styles.dart';
import 'home_dashboard_screen.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int _selectedGrade = 10;
  final List<String> _subjects = [
    'Physics',
    'Mathematics',
    'Chemistry',
    'Biology',
    'Computer Science',
    'History',
    'Geography',
    'Economics'
  ];
  final Set<String> _selectedSubjects = {'Physics', 'Mathematics'};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'TAILOR YOUR\nLEARNING',
                style: SacredStyles.withColor(
                  SacredStyles.display32Bold
                      .copyWith(height: 1.1, fontSize: 36),
                  theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Select your academic level and subjects to personalize your hub.',
                style: SacredStyles.withColor(
                  SacredStyles.inter14,
                  isDark
                      ? AppColors.textSecondary
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 40),

              // Grade Section
              Text(
                'Select Grade',
                style: SacredStyles.withColor(
                  SacredStyles.inter16
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedGrade = 8 + index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      int grade = 8 + index;
                      bool isSelected = _selectedGrade == grade;
                      return Center(
                        child: Text(
                          'Grade $grade',
                          style: SacredStyles.withColor(
                            isSelected
                                ? SacredStyles.inter16.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 24)
                                : SacredStyles.inter16.copyWith(fontSize: 18),
                            isSelected
                                ? AppColors.primary
                                : (isDark
                                    ? AppColors.textSecondary
                                    : AppColors.textSecondaryLight),
                          ),
                        ),
                      );
                    },
                    childCount: 5,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Subjects Section
              Text(
                'Interests & Subjects',
                style: SacredStyles.withColor(
                  SacredStyles.inter16
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: _subjects.length,
                  itemBuilder: (context, index) {
                    String subject = _subjects[index];
                    bool isSelected = _selectedSubjects.contains(subject);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedSubjects.remove(subject);
                          } else {
                            _selectedSubjects.add(subject);
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : theme.colorScheme.outline,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          subject,
                          style: SacredStyles.withColor(
                            isSelected
                                ? SacredStyles.inter14
                                    .copyWith(fontWeight: FontWeight.bold)
                                : SacredStyles.inter14,
                            isSelected
                                ? Colors.white
                                : (isDark
                                    ? AppColors.textOffWhite
                                    : AppColors.textMain),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // CTA
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(userPrefsProvider.notifier)
                          .setGrade(_selectedGrade);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const HomeDashboardScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Enter PadhLe Hub',
                      style: SacredStyles.withColor(
                          SacredStyles.inter16
                              .copyWith(fontWeight: FontWeight.bold),
                          Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
