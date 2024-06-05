part of presentation_widget;

class AppAboutDialog {
  static AlertDialog showAppAboutDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String btn1Text,
    required String btn2Text,
    required Function() onFirstButtonClick,
    required Function() onSecondButtonClick,
  }) {
    var dialog = AlertDialog(
      titlePadding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 2,
      ),
      contentPadding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      actionsPadding: EdgeInsets.zero,
      backgroundColor: AppColors.white.withOpacity(1),
      title: Text(
        title,
        style: AddMediaTextTheme.confirmTitle,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        style: AddMediaTextTheme.confirmDescription,
        textAlign: TextAlign.center,
      ),
      actions: [
        const Divider(
          height: 1,
          color: AppColors.gray,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: onFirstButtonClick,
              child: Container(
                color: AppColors.grayLight,
                width: 100,
                child: Center(
                  child: Text(
                    btn1Text,
                    style: AddMediaTextTheme.appBarLeading,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 1,
              color: AppColors.gray,
            ),
            GestureDetector(
              onTap: onSecondButtonClick,
              child: Container(
                color: AppColors.grayLight,
                width: 100,
                child: Center(
                  child: Text(
                    btn2Text,
                    style: AddMediaTextTheme.appBarLeading,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
    showDialog(
      context: context,
      builder: (context) {
        return dialog;
      },
    );
    return dialog;
  }
}
