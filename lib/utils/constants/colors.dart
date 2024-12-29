import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // App Basic Colors
  static const Color secondary = Color(0xFF4B68FF);
  static const Color primary = Color(0xff7EE787);
  static const Color accent = Color(0xFFD2A8FF);

  // Scaffold
  static Color lightScaffold = const Color(0xff6daedb);
  // static Color lightScaffold = const Color(0xff6daedb).withOpacity(.3);
  static const Color darkScaffold = Color(0xFF212332);
  // static const Color darkScaffold = Color(0xFF161B22);

  static const primaryColor = Color(0xFF2697FF);
  static const secondaryDarkColor = Color(0xFF2A2D3E);
  // static const secondaryDarkColor = Color(0xFF30363D);
  static const secondaryLightColor = Color(0xFF3572A5);

  static const Color redColor = Color(0xFFFF7A7A);
  static const Color greenColor = Color(0xFF33B500);
  static const Color yellowColor = Colors.orange;

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757C);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.white.withOpacity(.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF292a73);

  static const Color buttonSecondary = Color(0xFF3572A5);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral shades
  static const Color black = Color(0xFF161B22);
  static const Color darkerGrey = Color(0xFF30363D);
  static const Color darkGrey = Color(0xFF8B949E);
  static const Color grey = Color(0xFFC9D1D9);
  static const Color softGrey = Color(0xFFB7B7B7);
  static const Color lightGrey = Color(0xFFE8E9ED);
  static const Color white = Color(0xFFFFFFFF);
}