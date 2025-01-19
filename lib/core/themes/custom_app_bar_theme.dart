import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/core/constants/constants.dart';

import 'app_typography.dart';

/// A utility class for creating custom [AppBarTheme] configurations.
class CustomAppBarTheme {
  /// The background color of the AppBar.
  final Color? backgroundColor;

  /// The foreground color of the AppBar (e.g., text and icon colors).
  final Color? foregroundColor;

  /// The elevation of the AppBar.
  final double? elevation;

  /// The shadow color of the AppBar.
  final Color? shadowColor;

  /// The surface tint color of the AppBar.
  final Color? surfaceTintColor;

  /// The shape of the AppBar (e.g., rounded corners).
  final ShapeBorder? shape;

  /// The icon theme of the AppBar.
  final IconThemeData? iconTheme;

  /// The icon theme for action buttons in the AppBar.
  final IconThemeData? actionsIconTheme;

  /// Whether the title is centered in the AppBar.
  final bool? centerTitle;

  /// The spacing for the AppBar title.
  final double? titleSpacing;

  /// The height of the toolbar in the AppBar.
  final double? toolbarHeight;

  /// The text style of the AppBar toolbar.
  final TextStyle? toolbarTextStyle;

  /// The text style of the AppBar title.
  final TextStyle? titleTextStyle;

  /// The system UI overlay style (e.g., status bar color, icons).
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// Constructor for creating a custom [CustomAppBarTheme] instance.
  CustomAppBarTheme({
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.iconTheme,
    this.actionsIconTheme,
    this.centerTitle,
    this.titleSpacing,
    this.toolbarHeight,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
  });

  /// Factory constructor for creating a default AppBar configuration.
  factory CustomAppBarTheme.defaultConfig() {
    return CustomAppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.amber,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleSpacing: 0,
      toolbarHeight: 56.0, // Default toolbar height
      titleTextStyle: AppTypography.kDisplaySmall(color: AppColors.text),
      toolbarTextStyle: AppTypography.kTextSmall(color: AppColors.text),
      iconTheme: const IconThemeData(color: AppColors.text),
      actionsIconTheme: const IconThemeData(color: AppColors.text),
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  /// Builds the [AppBarTheme] instance.
  AppBarTheme buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle: systemOverlayStyle,
    );
  }
}
