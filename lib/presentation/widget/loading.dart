part of presentation_widget;

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: AppColors.gray,
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            context.localization.loading,
            style: AppThemeData.labelInputStyle,
          ),
        ],
      ),
    );
  }
}
