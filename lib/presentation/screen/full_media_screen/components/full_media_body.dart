part of presentation_full_media_screen;

class FullMediaBody extends StatelessWidget {
  const FullMediaBody({
    super.key,
    required this.user,
    required this.media,
  });

  final UserModel user;
  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<FullMediaBloc>().add(
              FullMediaEvent.getMedia(mediaId: media.id),
            );
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return FullImage(media: media);
                    },
                  );
                },
                child: Image.network(
                  '${AppConst.baseUrl}/media/${media.imageData?.name}',
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.error,
                    color: AppColors.errorRed,
                  ),
                  fit: BoxFit.cover,
                  height: 270,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      media.name,
                      style: FullMediaTextTheme.mediaName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.userName,
                          style: FullMediaTextTheme.username,
                        ),
                        Text(
                          media.dateCreate.formatDate(),
                          style: FullMediaTextTheme.dateCreated,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    media.description,
                    style: FullMediaTextTheme.mediaDescription,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
