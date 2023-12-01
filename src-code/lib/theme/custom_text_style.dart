import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge17 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 17.fSize,
      );
  // Display text style
  static get displayMediumGray90002 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.gray90002,
        fontSize: 45.fSize,
        fontWeight: FontWeight.w400,
      );
  static get displayMediumPrimary => theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 50.fSize,
        fontWeight: FontWeight.w400,
      );
  static get displayMediumPrimaryContainer =>
      theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 45.fSize,
        fontWeight: FontWeight.w400,
      );
  // Headline text style
  static get headlineLargeBlack90001 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeBlack90001_1 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black90001,
      );
  static get headlineLargeLightgreen100 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.lightGreen100,
        fontWeight: FontWeight.w700,
      );
  static get headlineLargePrimaryContainer =>
      theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get headlineLargeRegular => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineMedium26 => theme.textTheme.headlineMedium!.copyWith(
        fontSize: 26.fSize,
      );
  static get headlineMedium29 => theme.textTheme.headlineMedium!.copyWith(
        fontSize: 29.fSize,
      );
  static get headlineMediumAmber200 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.amber200,
        fontWeight: FontWeight.w700,
      );
  static get headlineMediumBlack90001 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black90001,
        fontSize: 29.fSize,
      );
  static get headlineMediumBlack90001Bold =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w700,
      );
  static get headlineMediumBlack90001_1 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get headlineMediumBold => theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineMediumPrimaryContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 26.fSize,
      );
  static get headlineMediumPrimaryContainer_1 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  // Title text style
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
      );
  static get titleLargeMontserrat =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        fontSize: 23.fSize,
      );
  static get titleLargeMontserratAmber200 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.amber200,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeMontserratBlack900 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.black900.withOpacity(0.53),
        fontWeight: FontWeight.w700,
      );
  static get titleLargeMontserratBlack90001 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.black90001.withOpacity(0.53),
        fontWeight: FontWeight.w700,
      );
  static get titleLargeMontserratBold =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeMontserratGray90002 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.gray90002,
      );
  static get titleLargeMontserratGray9000220 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.gray90002,
        fontSize: 20.fSize,
      );
  static get titleLargeMontserratGray9000220_1 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.gray90002.withOpacity(0.6),
        fontSize: 20.fSize,
      );
  static get titleLargeMontserratPrimary =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 21.fSize,
      );
  static get titleLargeMontserratPrimary23 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 23.fSize,
      );
  static get titleLargeMontserratPrimaryContainer =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get titleLargeMontserratPrimaryContainer20 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 20.fSize,
      );
  static get titleLargeMontserratPrimaryContainer20_1 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 20.fSize,
      );
  static get titleLargeMontserrat_1 => theme.textTheme.titleLarge!.montserrat;
  static get titleLargeMontserrat_2 => theme.textTheme.titleLarge!.montserrat;
}

extension on TextStyle {
  TextStyle get lexend {
    return copyWith(
      fontFamily: 'Lexend',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}
