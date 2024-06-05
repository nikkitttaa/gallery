part of presentation_profile;

class UserMediaGrid extends StatelessWidget {
  const UserMediaGrid({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPhotoBloc, NewPhotoState>(
      builder: (context, state) {
        final media = state.photoList;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                padding: EdgeInsets.zero,
                itemCount: media.length,
                itemBuilder: (context, index) {
                  final MediaModel photo = media[index];
                  return GestureDetector(
                    onTap: () {
                      context.router.push(
                        FullUserMediaRoute(
                          media: photo,
                          user: user,
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
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
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (state.status.isLoading && !state.isFirstLoading) ...[
              const ImageLoader(),
            ],
            if (state.photoList.isEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Center(
                  child: Text(
                    context.localization.noFoundImage,
                    style: AppThemeData.btnText,
                  ),
                ),
              ),
            ]
          ],
        );
      },
    );
  }
}
