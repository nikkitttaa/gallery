part of presentation_theme;

class AppButtonTheme {
  static final buttonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 45,
          vertical: 10,
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.grayLight;
          }
          if (states.contains(MaterialState.pressed)) {
            return AppColors.main;
          }
          return AppColors.black;
        },
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray;
          }
          if (states.contains(MaterialState.pressed)) {
            return AppColors.white;
          }
          return AppColors.white;
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 45,
          vertical: 10,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16),
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return const BorderSide(color: AppColors.grayLight);
          }
          if (states.contains(MaterialState.pressed)) {
            return const BorderSide(color: AppColors.main);
          }

          return const BorderSide(color: AppColors.black);
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray;
          }
          if (states.contains(MaterialState.pressed)) {
            return AppColors.main;
          }
          return AppColors.black;
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );

  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 45,
          vertical: 10,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.grayLight;
          }
          if (states.contains(MaterialState.pressed)) {
            return AppColors.main;
          }
          return AppColors.black;
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
