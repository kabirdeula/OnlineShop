import 'package:flutter/material.dart';

/// A collection of text styles used across the app.
///
/// Each style is customizable with a [color] and scaled using [ScreenUtil] to
/// ensure responsiveness across different screen sizes.
class AppTypography {
  static TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    required double lineHeight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineHeight,
      letterSpacing: letterSpacing,
    );
  }

  /// Display large text style with optional color.
  static TextStyle kDisplayLarge({Color? color}) {
    return _textStyle(
      fontSize: 50,
      fontWeight: FontWeight.w400,
      color: color,
      lineHeight: 50 / 50,
      letterSpacing: 1,
    );
  }

  /// Display medium text style with optional color.
  static TextStyle kDisplayMedium({Color? color}) {
    return _textStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: color,
      lineHeight: 36 / 32,
      letterSpacing: 1,
    );
  }

  /// Display small text style with optional color.
  static TextStyle kDisplaySmall({Color? color}) {
    return _textStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: color,
      lineHeight: 32 / 24,
      letterSpacing: 1,
    );
  }

  /// Bold large text style with optional color.
  static TextStyle kDisplayLargeBold({Color? color}) {
    return _textStyle(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: color,
      lineHeight: 50 / 48,
      letterSpacing: 1,
    );
  }

  /// Bold medium text style with optional color.
  static TextStyle kDisplayMediumBold({Color? color}) {
    return _textStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: color,
      lineHeight: 36 / 32,
      letterSpacing: 1,
    );
  }

  /// Bold small text style with optional color.
  static TextStyle kDisplaySmallBold({Color? color}) {
    return _textStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color,
      lineHeight: 32 / 24,
      letterSpacing: 1,
    );
  }

  /// Large text style for body content with optional color.
  static TextStyle kTextLarge({Color? color}) {
    return _textStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: color,
      lineHeight: 32 / 20,
      letterSpacing: 0.75,
    );
  }

  /// Medium text style for body content with optional color.
  static TextStyle kTextMedium({Color? color}) {
    return _textStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
      lineHeight: 28 / 16,
      letterSpacing: 0.75,
    );
  }

  /// Small text style for body content with optional color.
  static TextStyle kTextSmall({Color? color}) {
    return _textStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
      lineHeight: 24 / 14,
      letterSpacing: 0.75,
    );
  }

  /// Extra small text style for body content with optional color.
  static TextStyle kTextXSmall({Color? color}) {
    return _textStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: color,
      lineHeight: 22 / 13,
      letterSpacing: 0.25,
    );
  }

  /// Large text style for links with optional color.
  static TextStyle kLinkLarge({Color? color}) {
    return _textStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color,
      lineHeight: 32 / 20,
      letterSpacing: 0.75,
    );
  }

  /// Medium text style for links with optional color.
  static TextStyle kLinkMedium({Color? color}) {
    return _textStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
      lineHeight: 28 / 16,
      letterSpacing: 0.75,
    );
  }

  /// Small text style for links with optional color.
  static TextStyle kLinkSmall({Color? color}) {
    return _textStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
      lineHeight: 26 / 14,
      letterSpacing: 0.75,
    );
  }

  /// Extra small text style for links with optional color.
  static TextStyle kLinkXSmall({Color? color}) {
    return _textStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: color,
      lineHeight: 20 / 13,
      letterSpacing: 0.25,
    );
  }

  /// Medium text style for button text with optional color.
  static TextStyle kButtonTextMedium({Color? color}) {
    return _textStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: color,
      lineHeight: 34 / 18,
      letterSpacing: 0.75,
    );
  }
}
