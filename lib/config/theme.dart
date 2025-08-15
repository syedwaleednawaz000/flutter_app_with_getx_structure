import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  // Light Theme Colors
  static const Color lightPrimaryColor = Color(0xFF2196F3);
  static const Color lightPrimaryVariantColor = Color(0xFF1976D2);
  static const Color lightSecondaryColor = Color(0xFFFF9800);
  static const Color lightSecondaryVariantColor = Color(0xFFF57C00);
  static const Color lightBackgroundColor = Color(0xFFFAFAFA);
  static const Color lightSurfaceColor = Color(0xFFFFFFFF);
  static const Color lightErrorColor = Color(0xFFD32F2F);
  static const Color lightOnPrimaryColor = Color(0xFFFFFFFF);
  static const Color lightOnSecondaryColor = Color(0xFF000000);
  static const Color lightOnBackgroundColor = Color(0xFF000000);
  static const Color lightOnSurfaceColor = Color(0xFF000000);
  static const Color lightOnErrorColor = Color(0xFFFFFFFF);
  
  // Dark Theme Colors
  static const Color darkPrimaryColor = Color(0xFF90CAF9);
  static const Color darkPrimaryVariantColor = Color(0xFF42A5F5);
  static const Color darkSecondaryColor = Color(0xFFFFB74D);
  static const Color darkSecondaryVariantColor = Color(0xFFFF8A65);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color darkSurfaceColor = Color(0xFF1E1E1E);
  static const Color darkErrorColor = Color(0xFFEF5350);
  static const Color darkOnPrimaryColor = Color(0xFF000000);
  static const Color darkOnSecondaryColor = Color(0xFF000000);
  static const Color darkOnBackgroundColor = Color(0xFFFFFFFF);
  static const Color darkOnSurfaceColor = Color(0xFFFFFFFF);
  static const Color darkOnErrorColor = Color(0xFF000000);
  
  // Common Colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color infoColor = Color(0xFF2196F3);
  static const Color disabledColor = Color(0xFFBDBDBD);
  static const Color dividerColor = Color(0xFFE0E0E0);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color shadowColor = Color(0x1F000000);
  
  // Text Colors
  static const Color lightTextPrimaryColor = Color(0xFF212121);
  static const Color lightTextSecondaryColor = Color(0xFF757575);
  static const Color lightTextDisabledColor = Color(0xFFBDBDBD);
  static const Color darkTextPrimaryColor = Color(0xFFFFFFFF);
  static const Color darkTextSecondaryColor = Color(0xFFB3B3B3);
  static const Color darkTextDisabledColor = Color(0xFF666666);
  
  // Border Radius
  static const double smallRadius = 4.0;
  static const double mediumRadius = 8.0;
  static const double largeRadius = 12.0;
  static const double extraLargeRadius = 16.0;
  
  // Spacing
  static const double xsSpacing = 4.0;
  static const double smSpacing = 8.0;
  static const double mdSpacing = 16.0;
  static const double lgSpacing = 24.0;
  static const double xlSpacing = 32.0;
  static const double xxlSpacing = 48.0;
  
  // Font Sizes
  static const double xsFontSize = 10.0;
  static const double smFontSize = 12.0;
  static const double mdFontSize = 14.0;
  static const double lgFontSize = 16.0;
  static const double xlFontSize = 18.0;
  static const double xxlFontSize = 20.0;
  static const double xxxlFontSize = 24.0;
  static const double displayFontSize = 32.0;
  
  // Font Weights
  static const FontWeight lightWeight = FontWeight.w300;
  static const FontWeight normalWeight = FontWeight.w400;
  static const FontWeight mediumWeight = FontWeight.w500;
  static const FontWeight semiBoldWeight = FontWeight.w600;
  static const FontWeight boldWeight = FontWeight.w700;
  
  // Animation Durations
  static const Duration shortDuration = Duration(milliseconds: 200);
  static const Duration mediumDuration = Duration(milliseconds: 300);
  static const Duration longDuration = Duration(milliseconds: 500);
  
  // Elevation
  static const double smallElevation = 2.0;
  static const double mediumElevation = 4.0;
  static const double largeElevation = 8.0;
  static const double extraLargeElevation = 16.0;
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      primarySwatch: Colors.blue,
      colorScheme: const ColorScheme.light(
        primary: lightPrimaryColor,
        primaryContainer: lightPrimaryVariantColor,
        secondary: lightSecondaryColor,
        secondaryContainer: lightSecondaryVariantColor,
        surface: lightSurfaceColor,
        background: lightBackgroundColor,
        error: lightErrorColor,
        onPrimary: lightOnPrimaryColor,
        onSecondary: lightOnSecondaryColor,
        onSurface: lightOnSurfaceColor,
        onBackground: lightOnBackgroundColor,
        onError: lightOnErrorColor,
      ),
      scaffoldBackgroundColor: lightBackgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: lightPrimaryColor,
        foregroundColor: lightOnPrimaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: lightOnPrimaryColor,
          fontSize: xlFontSize,
          fontWeight: mediumWeight,
        ),
      ),
      // cardTheme: CardTheme(
      //   color: lightSurfaceColor,
      //   elevation: smallElevation,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(mediumRadius),
      //   ),
      //   margin: const EdgeInsets.all(smSpacing),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: lightPrimaryColor,
      //     foregroundColor: lightOnPrimaryColor,
      //     elevation: smallElevation,
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: lgSpacing,
      //       vertical: mdSpacing,
      //     ),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(mediumRadius),
      //     ),
      //     textStyle: const TextStyle(
      //       fontSize: lgFontSize,
      //       fontWeight: mediumWeight,
      //     ),
      //   ),
      // ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: lightPrimaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: mdSpacing,
            vertical: smSpacing,
          ),
          textStyle: const TextStyle(
            fontSize: lgFontSize,
            fontWeight: mediumWeight,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: lightPrimaryColor,
          side: const BorderSide(color: lightPrimaryColor),
          padding: const EdgeInsets.symmetric(
            horizontal: lgSpacing,
            vertical: mdSpacing,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(mediumRadius),
          ),
          textStyle: const TextStyle(
            fontSize: lgFontSize,
            fontWeight: mediumWeight,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
          borderSide: const BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
          borderSide: const BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
          borderSide: const BorderSide(color: lightPrimaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
          borderSide: const BorderSide(color: lightErrorColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: mdSpacing,
          vertical: mdSpacing,
        ),
        labelStyle: const TextStyle(
          color: lightTextSecondaryColor,
          fontSize: mdFontSize,
        ),
        hintStyle: const TextStyle(
          color: lightTextDisabledColor,
          fontSize: mdFontSize,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: displayFontSize,
          fontWeight: boldWeight,
          color: lightTextPrimaryColor,
        ),
        displayMedium: TextStyle(
          fontSize: xxxlFontSize,
          fontWeight: boldWeight,
          color: lightTextPrimaryColor,
        ),
        displaySmall: TextStyle(
          fontSize: xxlFontSize,
          fontWeight: boldWeight,
          color: lightTextPrimaryColor,
        ),
        headlineLarge: TextStyle(
          fontSize: xxlFontSize,
          fontWeight: boldWeight,
          color: lightTextPrimaryColor,
        ),
        headlineMedium: TextStyle(
          fontSize: xlFontSize,
          fontWeight: semiBoldWeight,
          color: lightTextPrimaryColor,
        ),
        headlineSmall: TextStyle(
          fontSize: lgFontSize,
          fontWeight: semiBoldWeight,
          color: lightTextPrimaryColor,
        ),
        titleLarge: TextStyle(
          fontSize: lgFontSize,
          fontWeight: mediumWeight,
          color: lightTextPrimaryColor,
        ),
        titleMedium: TextStyle(
          fontSize: mdFontSize,
          fontWeight: mediumWeight,
          color: lightTextPrimaryColor,
        ),
        titleSmall: TextStyle(
          fontSize: smFontSize,
          fontWeight: mediumWeight,
          color: lightTextPrimaryColor,
        ),
        bodyLarge: TextStyle(
          fontSize: lgFontSize,
          fontWeight: normalWeight,
          color: lightTextPrimaryColor,
        ),
        bodyMedium: TextStyle(
          fontSize: mdFontSize,
          fontWeight: normalWeight,
          color: lightTextPrimaryColor,
        ),
        bodySmall: TextStyle(
          fontSize: smFontSize,
          fontWeight: normalWeight,
          color: lightTextSecondaryColor,
        ),
        labelLarge: TextStyle(
          fontSize: mdFontSize,
          fontWeight: mediumWeight,
          color: lightTextPrimaryColor,
        ),
        labelMedium: TextStyle(
          fontSize: smFontSize,
          fontWeight: mediumWeight,
          color: lightTextSecondaryColor,
        ),
        labelSmall: TextStyle(
          fontSize: xsFontSize,
          fontWeight: mediumWeight,
          color: lightTextSecondaryColor,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(
        color: lightTextSecondaryColor,
        size: 24,
      ),
      primaryIconTheme: const IconThemeData(
        color: lightPrimaryColor,
        size: 24,
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: darkPrimaryColor,
      primarySwatch: Colors.blue,
      colorScheme: const ColorScheme.dark(
        primary: darkPrimaryColor,
        primaryContainer: darkPrimaryVariantColor,
        secondary: darkSecondaryColor,
        secondaryContainer: darkSecondaryVariantColor,
        surface: darkSurfaceColor,
        background: darkBackgroundColor,
        error: darkErrorColor,
        onPrimary: darkOnPrimaryColor,
        onSecondary: darkOnSecondaryColor,
        onSurface: darkOnSurfaceColor,
        onBackground: darkOnBackgroundColor,
        onError: darkOnErrorColor,
      ),
      scaffoldBackgroundColor: darkBackgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkPrimaryColor,
        foregroundColor: darkOnPrimaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: darkOnPrimaryColor,
          fontSize: xlFontSize,
          fontWeight: mediumWeight,
        ),
      ),
      // cardTheme: CardTheme(
      //   color: darkSurfaceColor,
      //   elevation: smallElevation,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(mediumRadius),
      //   ),
      //   margin: const EdgeInsets.all(smSpacing),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPrimaryColor,
          foregroundColor: darkOnPrimaryColor,
          elevation: smallElevation,
          padding: const EdgeInsets.symmetric(
            horizontal: lgSpacing,
            vertical: mdSpacing,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(mediumRadius),
          ),
          textStyle: const TextStyle(
            fontSize: lgFontSize,
            fontWeight: mediumWeight,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: darkPrimaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: mdSpacing,
            vertical: smSpacing,
          ),
          textStyle: const TextStyle(
            fontSize: lgFontSize,
            fontWeight: mediumWeight,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkPrimaryColor,
          side: const BorderSide(color: darkPrimaryColor),
          padding: const EdgeInsets.symmetric(
            horizontal: lgSpacing,
            vertical: mdSpacing,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(mediumRadius),
          ),
          textStyle: const TextStyle(
            fontSize: lgFontSize,
            fontWeight: mediumWeight,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
          borderSide: const BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
          borderSide: const BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
          borderSide: const BorderSide(color: darkPrimaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
          borderSide: const BorderSide(color: darkErrorColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: mdSpacing,
          vertical: mdSpacing,
        ),
        labelStyle: const TextStyle(
          color: darkTextSecondaryColor,
          fontSize: mdFontSize,
        ),
        hintStyle: const TextStyle(
          color: darkTextDisabledColor,
          fontSize: mdFontSize,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: displayFontSize,
          fontWeight: boldWeight,
          color: darkTextPrimaryColor,
        ),
        displayMedium: TextStyle(
          fontSize: xxxlFontSize,
          fontWeight: boldWeight,
          color: darkTextPrimaryColor,
        ),
        displaySmall: TextStyle(
          fontSize: xxlFontSize,
          fontWeight: boldWeight,
          color: darkTextPrimaryColor,
        ),
        headlineLarge: TextStyle(
          fontSize: xxlFontSize,
          fontWeight: boldWeight,
          color: darkTextPrimaryColor,
        ),
        headlineMedium: TextStyle(
          fontSize: xlFontSize,
          fontWeight: semiBoldWeight,
          color: darkTextPrimaryColor,
        ),
        headlineSmall: TextStyle(
          fontSize: lgFontSize,
          fontWeight: semiBoldWeight,
          color: darkTextPrimaryColor,
        ),
        titleLarge: TextStyle(
          fontSize: lgFontSize,
          fontWeight: mediumWeight,
          color: darkTextPrimaryColor,
        ),
        titleMedium: TextStyle(
          fontSize: mdFontSize,
          fontWeight: mediumWeight,
          color: darkTextPrimaryColor,
        ),
        titleSmall: TextStyle(
          fontSize: smFontSize,
          fontWeight: mediumWeight,
          color: darkTextPrimaryColor,
        ),
        bodyLarge: TextStyle(
          fontSize: lgFontSize,
          fontWeight: normalWeight,
          color: darkTextPrimaryColor,
        ),
        bodyMedium: TextStyle(
          fontSize: mdFontSize,
          fontWeight: normalWeight,
          color: darkTextPrimaryColor,
        ),
        bodySmall: TextStyle(
          fontSize: smFontSize,
          fontWeight: normalWeight,
          color: darkTextSecondaryColor,
        ),
        labelLarge: TextStyle(
          fontSize: mdFontSize,
          fontWeight: mediumWeight,
          color: darkTextPrimaryColor,
        ),
        labelMedium: TextStyle(
          fontSize: smFontSize,
          fontWeight: mediumWeight,
          color: darkTextSecondaryColor,
        ),
        labelSmall: TextStyle(
          fontSize: xsFontSize,
          fontWeight: mediumWeight,
          color: darkTextSecondaryColor,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(
        color: darkTextSecondaryColor,
        size: 24,
      ),
      primaryIconTheme: const IconThemeData(
        color: darkPrimaryColor,
        size: 24,
      ),
    );
  }
}
