part of presentation_settings;

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SettingsBloc, SettingsState>(
        builder: (BuildContext context, state) {
          if (state.status.isLoading) {
            context.read<SettingsBloc>().add(const SettingsEvent.loadInfo());
            return const Loading();
          } else {
            final UserModel? user = state.user;
            return SettingBody(
              user: user,
            );
          }
        },
        listener: (BuildContext context, state) {
          if (state.status.isUpdateSuccess) {
            context.router.maybePop();
            AppSnackBar.show(
              context: context,
              text: context.localization.successChangedData,
              backgroundColor: AppColors.gray,
            );
          } else if (state.status.isUpdateFailure) {
            AppSnackBar.show(
              context: context,
              text: context.localization.failureChangedData,
              backgroundColor: AppColors.errorRed,
            );
          }
          if (state.status.isSignOutSuccess) {
            context.router.replaceAll([const UnboardingRoute()]);
          }
          if (state.status.isDeleteSuccess) {
            context.router.replaceAll([const UnboardingRoute()]);
          }
        },
      ),
    );
  }
}
