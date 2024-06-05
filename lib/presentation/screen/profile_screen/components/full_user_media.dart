part of presentation_profile;

@RoutePage()
class FullUserMediaScreen extends StatelessWidget implements AutoRouteWrapper {
  const FullUserMediaScreen({
    super.key,
    required this.media,
    required this.user,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        mediaUseCase: locator(),
        userUseCase: locator(),
      ),
      child: this,
    );
  }

  final MediaModel media;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: BaseLeading(
          text: context.localization.back,
          icon: AppIcon.back,
          onTap: () {
            context.router.maybePop();
          },
        ),
      ),
      body: RefreshIndicator(
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      AppAboutDialog.showAppAboutDialog(
                        context: context,
                        title: context.localization.deleteMedia,
                        content: context.localization.deleteMediaDescription,
                        btn1Text: context.localization.yes,
                        btn2Text: context.localization.no,
                        onFirstButtonClick: () {
                          context.read<ProfileBloc>().add(
                                ProfileEvent.deleteMedia(
                                  mediaObjectId: media.imageData!.id!,
                                  photoId: media.id,
                                ),
                              );
                          context.router.replace(
                            const ProfileRoute(),
                          );
                        },
                        onSecondButtonClick: () {
                          context.router.maybePop();
                        },
                      );
                    },
                    child: Text(
                      context.localization.delete,
                      style: AppThemeData.btnText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
