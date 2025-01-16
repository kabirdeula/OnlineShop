import 'package:flutter/material.dart';
import 'package:online_shop/core/constants/constants.dart';

import 'themes.dart';

/// A customizable TabBar theme configuration for styling TabBars across the app.
class CustomTabBarTheme {
  /// Color of the indicator under the selected tab.
  final Color? indicatorColor;

  /// Color of the selected tab label.
  final Color? labelColor;

  /// Text style of the selected tab label.
  final TextStyle? labelStyle;

  /// Color of the unselected tab label.
  final Color? unselectedLabelColor;

  /// Text style of the unselected tab label.
  final TextStyle? unselectedLabelStyle;

  /// Alignment of the tabs within the TabBar.
  final TabAlignment? tabAlignment;

  /// Creates a [CustomTabBarTheme] instance with optional parameters for customization.
  CustomTabBarTheme({
    this.indicatorColor,
    this.labelColor,
    this.labelStyle,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.tabAlignment,
  });

  /// Factory constructor that provides the default TabBar theme configuration.
  ///
  /// - `indicatorColor`: Uses the primary app color.
  /// - `labelColor`: Primary color for the selected tab label.
  /// - `labelStyle`: Uses `AppTypography.kLinkSmall()`.
  /// - `unselectedLabelColor`: Uses the default active title color.
  /// - `unselectedLabelStyle`: Uses `AppTypography.kTextSmall()`.
  /// - `tabAlignment`: Aligns tabs to the start by default.
  factory CustomTabBarTheme.defaultConfig() {
    return CustomTabBarTheme(
      indicatorColor: AppColors.text,
      labelColor: AppColors.text,
      labelStyle: AppTypography.kLinkSmall(),
      unselectedLabelColor: AppColors.textLight,
      unselectedLabelStyle: AppTypography.kTextSmall(),
      tabAlignment: TabAlignment.start,
    );
  }

  /// Builds a [TabBarTheme] instance based on the current configuration.
  ///
  /// This can be used in the app's theme configuration to style TabBars consistently.
  TabBarThemeData buildTabBarTheme() {
    return TabBarThemeData(
      indicatorColor: indicatorColor,
      labelColor: labelColor,
      labelStyle: labelStyle,
      unselectedLabelColor: unselectedLabelColor,
      unselectedLabelStyle: unselectedLabelStyle,
      tabAlignment: tabAlignment,
    );
  }
}
