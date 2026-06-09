import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_challenge_app/app/design/talkware_brand_colors.dart';
import 'package:profile_challenge_app/app/design/talkware_radius.dart';

class TalkwareTheme {
  TalkwareTheme._();

  static const styleName = 'Talkware Enterprise';

  static ThemeData get light {
    final fontFamily = GoogleFonts.inter().fontFamily;

    return FlexThemeData.light(
      useMaterial3: true,
      colors: const FlexSchemeColor(
        primary: TalkwareBrandColors.navy,
        primaryContainer: Color(0xFFE6EEF8),
        secondary: TalkwareBrandColors.blue,
        secondaryContainer: Color(0xFFE5F0FF),
        tertiary: TalkwareBrandColors.accentBlue,
        tertiaryContainer: Color(0xFFE0F2FE),
        error: TalkwareBrandColors.error,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 4,
      scaffoldBackground: TalkwareBrandColors.background,
      fontFamily: fontFamily,
      subThemesData: _subThemes,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      appBarBackground: TalkwareBrandColors.background,
    );
  }

  static ThemeData get dark {
    final fontFamily = GoogleFonts.inter().fontFamily;

    return FlexThemeData.dark(
      useMaterial3: true,
      colors: const FlexSchemeColor(
        primary: TalkwareBrandColors.accentBlue,
        primaryContainer: TalkwareBrandColors.deepNavy,
        secondary: Color(0xFF66A8FF),
        secondaryContainer: TalkwareBrandColors.navy,
        tertiary: Color(0xFFB7DCFF),
        tertiaryContainer: Color(0xFF062A73),
        error: Color(0xFFFFB4AB),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 8,
      scaffoldBackground: const Color(0xFF020817),
      fontFamily: fontFamily,
      subThemesData: _subThemes,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      appBarBackground: const Color(0xFF020817),
    );
  }

  static const FlexSubThemesData _subThemes = FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    blendOnLevel: 8,
    blendOnColors: false,
    defaultRadius: TalkwareRadius.md,
    cardRadius: TalkwareRadius.md,
    buttonMinSize: Size(40, 44),
    inputDecoratorRadius: TalkwareRadius.md,
    inputDecoratorIsFilled: true,
    drawerWidth: 320,
  );
}
