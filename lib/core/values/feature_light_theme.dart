import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/app_bar_buttons.dart';
import '../widgets/no_padding_track_shape.dart';
import 'colors.dart';

class FeatureLightTheme extends StatelessWidget {
  final Widget child;
  final Color primaryColor;
  final Iterable<ThemeExtension<dynamic>>? extensions;

  const FeatureLightTheme({
    required this.primaryColor,
    required this.child,
    this.extensions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getDefaultTextTheme(context);

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        fontFamily: textTheme.bodyMedium?.fontFamily,
        fontFamilyFallback: textTheme.bodyMedium?.fontFamilyFallback,
        primaryTextTheme: textTheme,
        textTheme: textTheme,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.bg,
        primaryColor: primaryColor,
        extensions: extensions,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: primaryColor,
          onSecondary: Colors.white,
          error: AppColors.red,
          onError: Colors.white,
          surface: AppColors.bg,
          onSurface: AppColors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedLabelStyle: textTheme.bodySmall?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.grey4,
          ),
          selectedLabelStyle: textTheme.bodySmall?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
        tabBarTheme: TabBarThemeData(
          overlayColor: const WidgetStatePropertyAll(AppColors.grey1),
          dividerHeight: 0,
          dividerColor: primaryColor,
          labelPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: textTheme.bodySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          unselectedLabelStyle: textTheme.bodySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.grey3,
          ),
        ),
        dividerTheme: const DividerThemeData(
          endIndent: 0,
          color: AppColors.grey1,
          space: 0,
          thickness: 1,
          indent: 0,
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.grey3,
            minimumSize: const Size(52, 52),
            side: const BorderSide(width: 1, color: AppColors.grey3),
            textStyle: textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xFFFBFBFC),
            backgroundColor: primaryColor,
            shadowColor: primaryColor.withOpacity(0.4),
            elevation: 8,
            minimumSize: const Size(52, 52),
            textStyle: textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xFFFBFBFC),
            backgroundColor: primaryColor,
            minimumSize: const Size(52, 52),
            textStyle: textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primaryColor,
            minimumSize: const Size(52, 52),
            textStyle: textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
        ),
        datePickerTheme: const DatePickerThemeData(
          backgroundColor: AppColors.white,
        ),
        timePickerTheme: TimePickerThemeData(
          backgroundColor: AppColors.white,
          hourMinuteTextStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleSpacing: 16,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: textTheme.titleMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white.withOpacity(0),
          ),
        ),
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) => const AppBackButton(),
          closeButtonIconBuilder: (context) => const AppBarCloseButton(),
        ),
        switchTheme: SwitchThemeData(
          trackOutlineWidth: const WidgetStatePropertyAll(0),
          thumbColor: const WidgetStatePropertyAll(Colors.white),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          thumbIcon: const WidgetStatePropertyAll(Icon(Icons.circle)),
          trackOutlineColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.grey2;
            }

            if (states.contains(WidgetState.selected)) {
              return primaryColor;
            }

            return AppColors.grey4;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.grey2;
            }

            if (states.contains(WidgetState.selected)) {
              return primaryColor;
            }

            return AppColors.grey4;
          }),
        ),
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(
            width: 1,
            color: Colors.white,
          ),
          fillColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }

              return Colors.transparent;
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              width: 1,
              color: Colors.white,
            ),
          ),
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
          collapsedTextColor: Colors.white70,
          collapsedIconColor: Colors.white70,
          tilePadding: EdgeInsets.zero,
        ),
        cardColor: AppColors.cardBackground,
        cardTheme: CardThemeData(
          color: AppColors.cardBackground,
          surfaceTintColor: AppColors.cardBackground,
          shadowColor: const Color(0xffB4BBC8).withOpacity(0.1),
          elevation: 4.5,
        ),
        inputDecorationTheme: InputDecorationTheme(
          outlineBorder: const BorderSide(color: AppColors.grey4),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          hintStyle: textTheme.bodySmall?.copyWith(
            color: AppColors.grey4,
            fontWeight: FontWeight.w600,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.redLight, width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.redLight, width: 1.2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.grey2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.grey2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.grey4),
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: Colors.transparent,
        ),
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
          trackShape: NoPaddingTrackShape(),
          overlayColor: primaryColor,
          thumbColor: primaryColor,
          activeTrackColor: primaryColor,
          inactiveTrackColor: const Color(0xFFBCC1CD),
          disabledThumbColor: AppColors.grey3,
          disabledActiveTrackColor: AppColors.grey3,
          disabledInactiveTrackColor: const Color(0xFFBCC1CD),
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          textStyle: textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16),
              bottomStart: Radius.circular(16),
              bottomEnd: Radius.circular(16),
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}

TextTheme getDefaultTextTheme(BuildContext context) {
  final textStyle = TextStyle(
    fontFamily: 'Segoeui',
    fontFamilyFallback: ['yekanx'],
  );

  final textTheme = TextTheme(
    displayLarge: textStyle.copyWith(
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      wordSpacing: -1.5,
    ),
    displayMedium: textStyle.copyWith(
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      wordSpacing: -0.5,
    ),
    displaySmall: textStyle.copyWith(
      fontSize: 48.0,
      fontWeight: FontWeight.normal,
      wordSpacing: 0.0,
    ),
    headlineMedium: textStyle.copyWith(
      fontSize: 34.0,
      fontWeight: FontWeight.normal,
      wordSpacing: 0.25,
    ),
    headlineSmall: textStyle.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      wordSpacing: 0.0,
    ),
    titleLarge: textStyle.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      wordSpacing: 0.15,
    ),
    titleMedium: textStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      wordSpacing: 0.15,
    ),
    titleSmall: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      wordSpacing: 0.1,
    ),
    bodyLarge: textStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      wordSpacing: 0.5,
    ),
    bodyMedium: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      wordSpacing: 0.25,
    ),
    bodySmall: textStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      wordSpacing: 0.4,
    ),
    labelLarge: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      wordSpacing: 1.25,
    ),
    labelSmall: textStyle.copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      wordSpacing: 1.5,
    ),
  );

  return textTheme;
}
