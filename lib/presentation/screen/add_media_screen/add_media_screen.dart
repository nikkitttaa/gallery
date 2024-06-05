part of presentation_add_media;

@RoutePage()
class AddMediaScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddMediaScreen({
    super.key,
  });

  @override
  State<AddMediaScreen> createState() => _AddMediaScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMediaBloc(mediaUseCase: locator()),
      child: this,
    );
  }
}

class _AddMediaScreenState extends State<AddMediaScreen> {
  String? img;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMediaBloc, AddMediaState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const Loading();
        }
        return const AddMediaBody();
      },
      listener: (context, state) {
        if (state.status == Status.success) {
          AppSnackBar.show(
            context: context,
            text: context.localization.photoUpload,
            backgroundColor: AppColors.gray,
          );
          context.router.replaceAll([const HomeRoute()]);
        } else if (state.status == Status.failure) {
          AppSnackBar.show(
            context: context,
            text: context.localization.error,
            backgroundColor: AppColors.errorRed,
          );
        } else if (state.status == Status.nameNull) {
          AppSnackBar.show(
            context: context,
            text: context.localization.snackErrorNameNull,
            backgroundColor: AppColors.errorRed,
          );
        } else if (state.status == Status.imageNull) {
          AppSnackBar.show(
            context: context,
            text: context.localization.snackErrorImageNull,
            backgroundColor: AppColors.errorRed,
          );
        }
      },
    );
  }
}
