part of presentation_widget;

class AppSnackBar {
  static void show({
    required BuildContext context,
    required String text,
    required Color backgroundColor,
  }) {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          const Icon(
            Icons.info,
            color: AppColors.white,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppThemeData.snackBarText,
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
