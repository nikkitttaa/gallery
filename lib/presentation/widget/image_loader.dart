part of presentation_widget;

class ImageLoader extends StatelessWidget {
  const ImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.gray,
          strokeWidth: 1,
        ),
      ),
    );
  }
}
