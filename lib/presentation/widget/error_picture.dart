part of presentation_widget;

class ErrorPictureWidget extends StatelessWidget {
  const ErrorPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImage.errorLogo,
            color: AppColors.gray,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.localization.sorry,
            style: AppThemeData.labelInputStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.localization.errorDescription,
            style: AppThemeData.labelInputStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
