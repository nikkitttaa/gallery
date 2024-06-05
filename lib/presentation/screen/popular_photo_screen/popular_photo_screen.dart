part of presentation_popular_photo;

class PopularPhotoScreen extends StatefulWidget {
  const PopularPhotoScreen({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<PopularPhotoScreen> createState() => _PopularPhotoScreenState();
}

class _PopularPhotoScreenState extends State<PopularPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularPhotoBloc, PopularPhotoState>(
      builder: (context, state) {
        if (state.status.isInitial) {
          return Text(context.localization.initial);
        } else if (state.status.isLoading && state.isFirstLoading == true) {
          return const Loading();
        } else if (state.status.isError) {
          return const ErrorPictureWidget();
        } else {
          return NotificationListener<ScrollEndNotification>(
            onNotification: (scrollNotification) => pagination(scrollNotification, context),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.5, right: 8.5),
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<PopularPhotoBloc>().add(
                        const PopularPhotoEvent.getPhoto(
                          clearPhoto: true,
                          limit: AppConst.limitOfMedia,
                        ),
                      );
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PhotoBody(
                        photoList: state.photoList,
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
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  bool pagination(ScrollEndNotification scrollNotification, BuildContext context) {
    if (scrollNotification.hasReachedEnd) {
      context.read<PopularPhotoBloc>().add(
            PopularPhotoEvent.getPhoto(
              limit: AppConst.limitOfMedia,
              name: widget.searchController.text,
            ),
          );
      return true;
    }
    return true;
  }
}
