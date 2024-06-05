part of presentation_profile;

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
    required this.user,
    required this.state,
  });

  final ProfileState state;
  final UserModel user;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollNotification) => pagination(scrollNotification, context),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<ProfileBloc>().add(
                const ProfileEvent.loadUser(),
              );
          context.read<NewPhotoBloc>().add(
                NewPhotoEvent.getPhoto(
                  limit: AppConst.limitUserMedia,
                  clearPhoto: true,
                  userId: widget.user.id,
                ),
              );
        },
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: Column(
              children: [
                const Divider(
                  height: 1,
                  color: AppColors.gray,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      UserInfoContainer(
                        username: widget.user.userName,
                        birthday: widget.user.birthday,
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.main,
                      ),
                      UserMediaGrid(
                        user: widget.user,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool pagination(ScrollEndNotification scrollNotification, BuildContext context) {
    if (scrollNotification.hasReachedEnd) {
      context.read<NewPhotoBloc>().add(
            NewPhotoEvent.getPhoto(
              limit: AppConst.limitUserMedia,
              userId: widget.user.id,
            ),
          );
    }
    return true;
  }
}
