part of presentation_full_media_screen;

@RoutePage()
class FullMediaScreen extends StatelessWidget implements AutoRouteWrapper {
  const FullMediaScreen({
    super.key,
    required this.mediaId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => FullMediaBloc(
        mediaUseCase: locator(),
      )..add(
          FullMediaEvent.getMedia(
            mediaId: mediaId,
          ),
        ),
      child: this,
    );
  }

  final int mediaId;

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
      body: BlocBuilder<FullMediaBloc, FullMediaState>(
        builder: (BuildContext context, FullMediaState state) {
          if (state.status == MediaStatus.loading) {
            return const Loading();
          } else if (state.status == MediaStatus.loaded) {
            final media = state.media;
            final user = state.media!.authorMedia;
            return FullMediaBody(
              user: user!,
              media: media!,
            );
          } else {
            return const ErrorPictureWidget();
          }
        },
      ),
    );
  }
}
