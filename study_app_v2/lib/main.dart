import 'package:flutter/material.dart';
import 'package:study_app/screens/home_dashboard_screen.dart';
import 'package:study_app/theme/app_theme.dart';

void main() {
  runApp(const PadhLeApp());
}

class PadhLeApp extends StatelessWidget {
  const PadhLeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PadhLe V2',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode:
          ThemeMode.light, // Default to light for the premium yellowish look
      home: const HomeDashboardScreen(),
    );
  }
}
