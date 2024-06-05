part of presentation_new_photo;

class NewPhotoScreen extends StatefulWidget {
  const NewPhotoScreen({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<NewPhotoScreen> createState() => _NewPhotoScreenState();
}

class _NewPhotoScreenState extends State<NewPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPhotoBloc, NewPhotoState>(
      builder: (context, state) {
        if (state.status == Status.initial) {
          return Text(context.localization.initial);
        } else if (state.status == Status.loading && state.isFirstLoading == true) {
          return const Loading();
        } else if (state.status == Status.error) {
          return const ErrorPictureWidget();
        } else {
          return NotificationListener<ScrollEndNotification>(
            onNotification: (scrollNotification) => pagination(scrollNotification, context),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.5, right: 8.5),
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<NewPhotoBloc>().add(
                        const NewPhotoEvent.getPhoto(
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
      context.read<NewPhotoBloc>().add(
            NewPhotoEvent.getPhoto(
              limit: AppConst.limitOfMedia,
              name: widget.searchController.text,
            ),
          );
      return true;
    }
    return true;
  }
}
