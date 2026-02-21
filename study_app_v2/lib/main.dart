import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/providers/user_prefs_provider.dart';
import 'package:study_app/screens/onboarding_screen.dart';
import 'package:study_app/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: StudyApp(),
    ),
  );
}

class StudyApp extends ConsumerWidget {
  const StudyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPrefs = ref.watch(userPrefsProvider);

    return MaterialApp(
      title: 'Study App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: userPrefs.themeMode,
      home: const OnboardingScreen(),
    );
  }
}
