import 'package:flutter/material.dart';

import 'themes.dart';

/// Centralized theme management for the application.
class AppThemes {
  static ThemeData themeData() {
    return ThemeData(
      appBarTheme: _appBarTheme,
      // elevatedButtonTheme: _elevatedButtonTheme,
      // inputDecorationTheme: _inputDecorationTheme,
      // navigationBarTheme: _navigationBarTheme,
      fontFamily: 'NunitoSans',
      // scaffoldBackgroundColor: AppColors.offWhite,
      tabBarTheme: _tabBarTheme,
      useMaterial3: true,
    );
  }
}

final _appBarTheme = CustomAppBarTheme.defaultConfig().buildAppBarTheme();

final _tabBarTheme = CustomTabBarTheme.defaultConfig().buildTabBarTheme();
