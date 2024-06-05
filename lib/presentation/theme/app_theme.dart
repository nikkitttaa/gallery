part of presentation_theme;

class AppThemeData {
  static final ThemeData mainTheme = ThemeData(
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
    textButtonTheme: AppButtonTheme.textButtonTheme,
    elevatedButtonTheme: AppButtonTheme.buttonTheme,
    tabBarTheme: AppTabBarTheme.tabBarTheme,
    fontFamily: 'Roboto',
    bottomNavigationBarTheme: AppBottomNavBarTheme.bottomNavBarTheme,
  );

  static const TextStyle textStyleTabBar = TextStyle(
    fontSize: 18,
  );
  static const TextStyle textInputStyle = TextStyle(
    fontSize: 16,
  );
  static const TextStyle labelInputStyle = TextStyle(
    fontSize: 16,
    color: AppColors.gray,
  );
  static const TextStyle errorLabelInputStyle = TextStyle(
    fontSize: 16,
    color: AppColors.errorRed,
  );
  static const TextStyle disableInputStyle = TextStyle(
    fontSize: 16,
    color: AppColors.grayLight,
  );
  static const TextStyle appBarText = TextStyle(
    fontSize: 17,
    color: AppColors.blue,
  );
  static const TextStyle splashBoldText = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle btnText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle snackBarText = const TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
}
