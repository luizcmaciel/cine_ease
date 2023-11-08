import 'package:flutter/material.dart';

sealed class ThemeConfig {
  static ThemeData getTheme(String genre) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: ThemeFonts.fontFamily,
      colorSchemeSeed: _genreColors[genre],
      brightness: _genreBrightness[genre],
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32.0),
          ),
        ),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      cardTheme: const CardTheme(
        clipBehavior: Clip.hardEdge,
      ),
    );
  }

  static final Map<String, Color> _genreColors = {
    'default': Colors.deepPurple,
    'Ação': Colors.redAccent,
    'Comédia': Colors.greenAccent,
    'Drama': Colors.deepPurple,
    'Romance': Colors.deepPurple,
    'Documentário': Colors.yellowAccent,
    'Suspense': Colors.redAccent,
    'Terror': Colors.yellowAccent,
    'Ficção Científica': Colors.greenAccent,
  };

  static final Map<String, Brightness> _genreBrightness = {
    'default': Brightness.light,
    'Ação': Brightness.light,
    'Comédia': Brightness.light,
    'Drama': Brightness.dark,
    'Romance': Brightness.light,
    'Documentário': Brightness.light,
    'Suspense': Brightness.dark,
    'Terror': Brightness.dark,
    'Ficção Científica': Brightness.dark,
  };
}

sealed class ThemeFonts {
  static const String fontFamily = 'Poppins';
}
