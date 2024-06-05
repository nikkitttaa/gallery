part of presentation_full_media_screen;

class FullImage extends StatelessWidget {
  const FullImage({
    super.key,
    required this.media,
  });

  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: GestureDetector(
          onTap: () {
            context.router.maybePop();
          },
          child: Image.asset(
            AppIcon.back,
            color: AppColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: InteractiveViewer(
            minScale: 0.1,
            maxScale: 3,
            clipBehavior: Clip.none,
            boundaryMargin: const EdgeInsets.all(5),
            child: Image.network(
              '${AppConst.baseUrl}/media/${media.imageData?.name}',
              errorBuilder: (_, __, ___) => const Icon(
                Icons.error,
                color: AppColors.errorRed,
              ),
              fit: BoxFit.cover,
              height: 270,
            ),
          ),
        ),
      ),
    );
  }
}
