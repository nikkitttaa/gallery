part of presentation_theme;

class AppTabBarTheme {
  static final tabBarTheme = TabBarTheme(
    labelColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.pressed)) {
          return AppColors.main;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.black;
        }
        return AppColors.gray;
      },
    ),
    indicatorColor: AppColors.main,
  );
}
