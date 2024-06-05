part of presentation_profile;

@RoutePage()
class ProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(
            mediaUseCase: locator(),
            userUseCase: locator(),
          )..add(
              const ProfileEvent.loadUser(),
            ),
        ),
        BlocProvider(
          create: (context) => NewPhotoBloc(
            mediaUseCase: locator(),
          ),
        ),
      ],
      child: this,
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                context.router.push(const SettingRoute());
              },
              child: Image.asset(
                AppIcon.settings,
                color: AppColors.gray,
                scale: 0.85,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.status.isInitial) {
              return Center(
                child: Text(context.localization.initial),
              );
            } else if (state.status.isLoading) {
              return const Center(
                child: Loading(),
              );
            } else if (state.status.isError) {
              return const ErrorPictureWidget();
            } else {
              final user = state.userInfo;
              context.read<NewPhotoBloc>().add(
                    NewPhotoEvent.getPhoto(
                      limit: AppConst.limitUserMedia,
                      userId: user!.id,
                    ),
                  );
              return ProfileBody(
                user: user,
                state: state,
              );
            }
          },
          listener: (BuildContext context, ProfileState state) {
            if (state.status.isDeleteSuccess) {
              AppSnackBar.show(
                context: context,
                text: context.localization.successDeleteMedia,
                backgroundColor: AppColors.gray,
              );
              context.router.replaceAll(
                [
                  const ProfileRoute(),
                ],
              );
            } else if (state.status.isDeleteFailure) {
              AppSnackBar.show(
                context: context,
                text: context.localization.failureDeleteMedia,
                backgroundColor: AppColors.gray,
              );
            }
          },
        ),
      ),
    );
  }
}
