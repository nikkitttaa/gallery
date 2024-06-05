part of presentation_widget;

class BaseAppBar {
  static AppBar appBar({
    required String action,
    required VoidCallback onLeadingTap,
    required VoidCallback onActionTap,
    required String icon,
    required String leadingText,
  }) {
    return AppBar(
      leadingWidth: 100,
      leading: InkWell(
        onTap: onLeadingTap,
        child: Row(
          children: [
            Image.asset(
              icon,
              color: AppColors.blue,
            ),
            Text(
              leadingText,
              style: AppThemeData.appBarText,
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 9),
          child: GestureDetector(
            onTap: onActionTap,
            child: Text(
              action,
              style: AddMediaTextTheme.appBarAction,
            ),
          ),
        ),
      ],
    );
  }
}
