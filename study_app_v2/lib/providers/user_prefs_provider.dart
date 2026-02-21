import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPrefs {
  final bool isModernMode;
  final int selectedGrade;
  final ThemeMode themeMode;

  UserPrefs({
    this.isModernMode = true,
    this.selectedGrade = 10,
    this.themeMode = ThemeMode.dark,
  });

  UserPrefs copyWith({
    bool? isModernMode,
    int? selectedGrade,
    ThemeMode? themeMode,
  }) {
    return UserPrefs(
      isModernMode: isModernMode ?? this.isModernMode,
      selectedGrade: selectedGrade ?? this.selectedGrade,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

class UserPrefsNotifier extends StateNotifier<UserPrefs> {
  UserPrefsNotifier() : super(UserPrefs());

  void toggleModernMode() {
    state = state.copyWith(isModernMode: !state.isModernMode);
  }

  void toggleThemeMode() {
    state = state.copyWith(
      themeMode:
          state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
    );
  }

  void setGrade(int grade) {
    state = state.copyWith(selectedGrade: grade);
  }
}

final userPrefsProvider =
    StateNotifierProvider<UserPrefsNotifier, UserPrefs>((ref) {
  return UserPrefsNotifier();
});
