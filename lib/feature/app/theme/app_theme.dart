import 'package:flutter/material.dart';

/// The themes for the app
///
/// It includes the [colorScheme].
class AppTheme {
  /// General color scheme for the app, it gets assigned in the MaterialApp widget.
  static const colorScheme = ColorScheme(
    primary: Color(0xFF4B286D),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF000000),
    secondary: Color(0xFF2B8000),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color.fromARGB(255, 203, 179, 227),
    onSecondaryContainer: Color(0xFF000000),
    tertiary: Color(0xFF7C53A5),
    tertiaryContainer: Color(0xC3B1E1),
    onTertiary: Color(0xFFFFFFFF),
    onTertiaryContainer: Color(0xFF000000),
    error: Color(0xFFC12335),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF000000),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
    surfaceVariant: Color(0xFFFFE36E),
    onSurfaceVariant: Color(0xFF000000),
    outline: Color(0xFF686E71),
    brightness: Brightness.light,
  );

  /// General text scheme for the app, it gets assigned in the MaterialApp widget.
  static final textTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'HelveticaNowText',
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontFamily: 'HelveticaNowText',
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontFamily: 'HelveticaNowText',
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      fontFamily: 'HelveticaNowText',
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontFamily: 'HelveticaNowText',
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontFamily: 'HelveticaNowText',
      fontSize: 10,
      fontWeight: FontWeight.w700,
    ),
  ).apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  );

  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
        shape: StadiumBorder(
          side: BorderSide(color: colorScheme.primary, width: 2),
        ),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        textStyle: textTheme.displaySmall),
  );

  static final chipTheme = ChipThemeData(
    backgroundColor: colorScheme.background,
    selectedColor: colorScheme.secondaryContainer,
    shape:
        StadiumBorder(side: BorderSide(color: colorScheme.tertiary, width: 1)),
    labelStyle: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
  );

  static final iconTheme = IconThemeData(
    color: colorScheme.primary,
  );
}
