import 'package:google_fonts/google_fonts.dart';
import 'package:oringe/module_theme/pressistance/theme_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
      PublishSubject<ThemeData>();

  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  final ThemePreferencesHelper _preferencesHelper;

  AppThemeDataService(this._preferencesHelper);

  static Color get PrimaryColor {
   return Colors.pink.shade900;

  }

  ThemeData getActiveTheme() {
    var dark = _preferencesHelper.isDarkMode();
    final lightScheme = ColorScheme.fromSeed(seedColor: PrimaryColor);
    final darkScheme = ColorScheme.fromSeed(
        seedColor: PrimaryColor, brightness: Brightness.dark);
    if (dark == true) {
      return ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkScheme,
          useMaterial3: true,
          focusColor: PrimaryColor,
          checkboxTheme: CheckboxThemeData(
            checkColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return Colors.grey;
              }
              return Colors.white;
            }),
            fillColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return Colors.black;
              }
              return PrimaryColor;
            }),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              )),
          textTheme: TextTheme(button: TextStyle(color: Colors.white)));
    }
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: PrimaryColor,
        colorScheme: lightScheme,
        useMaterial3: true,
        primarySwatch:Colors.pink,
        textTheme: GoogleFonts.catamaranTextTheme(),
        timePickerTheme: TimePickerThemeData(
          dialBackgroundColor: Color.fromRGBO(235, 235, 235, 1),
          dayPeriodBorderSide:
          BorderSide(color: Color.fromRGBO(235, 235, 235, 1)),
        ));
  }

  void switchDarkMode(bool darkMode) async {
    if (darkMode) {
      _preferencesHelper.setDarkMode();
    } else {
      _preferencesHelper.setDayMode();
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }
}
