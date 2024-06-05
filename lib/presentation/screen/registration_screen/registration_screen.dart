part of presentation_registration;

@RoutePage()
class RegistrationScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(
        userRepository: locator(),
        authUseCase: locator(),
      ),
      child: this,
    );
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithUnderline(
        title: AppConst.empty,
        underlineColor: AppColors.grayLight,
        leading: BaseLeading(
          text: context.localization.cancel,
          icon: AppIcon.back,
          onTap: () {
            context.router.replace(const UnboardingRoute());
          },
        ),
        leadingWidth: 100,
        underlineWidth: 2,
        toolbarHeight: 44,
      ),
      body: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.router.replaceAll([const MainRoute()]);
          } else if (state.status.isError && (state.errors.isEmpty && state.errors.isNotEmpty)) {
            AppSnackBar.show(
              context: context,
              text: context.localization.error,
              backgroundColor: AppColors.errorRed,
            );
            context.router.replaceAll([const UnboardingRoute()]);
          }
        },
        builder: (context, state) {
          if (state.status.isLoading) {
            return const Loading();
          } else if (state.status.isError) {
            return const RegistrationBody();
          } else {
            return const RegistrationBody();
          }
        },
      ),
    );
  }
}
