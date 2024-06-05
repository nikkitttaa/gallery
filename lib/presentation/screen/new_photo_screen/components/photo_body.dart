part of presentation_new_photo;

class PhotoBody extends StatefulWidget {
  const PhotoBody({
    super.key,
    required this.photoList,
  });

  final List photoList;

  @override
  State<PhotoBody> createState() => _PhotoBodyState();
}

class _PhotoBodyState extends State<PhotoBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: widget.photoList.length,
      itemBuilder: (context, index) {
        final MediaModel photo = widget.photoList[index];
        return GestureDetector(
          onTap: () {
            context.router.push(
              FullMediaRoute(
                mediaId: photo.id,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(7.5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.grayLight,
                    spreadRadius: 0.5,
                    blurRadius: 7,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  height: 200,
                  width: 200,
                  image: NetworkImage(
                    '${AppConst.baseUrl}/media/${photo.imageData?.name}',
                  ),
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const ImageLoader();
                    }
                  },
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.error,
                    color: AppColors.errorRed,
                    size: 100,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
