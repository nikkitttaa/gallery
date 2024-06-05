part of presentation_authorization;

@RoutePage()
class AuthorizationScreen extends StatefulWidget implements AutoRouteWrapper {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBloc(
        authUseCase: locator(),
      ),
      child: this,
    );
  }
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithUnderline(
        title: AppConst.empty,
        underlineColor: AppColors.grayLight,
        leading: BaseLeading(
          text: context.localization.cancel,
          icon: AppIcon.back,
          onTap: () => context.router.replace(const UnboardingRoute()),
        ),
        leadingWidth: 100,
        underlineWidth: 2,
        toolbarHeight: 44,
      ),
      body: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.router.replaceAll([const MainRoute()]);
          }
          if (state.status.isFailure) {
            AppSnackBar.show(
              context: context,
              text: context.localization.userNotFound,
              backgroundColor: AppColors.errorRed,
            );
            context.router.replaceAll([const UnboardingRoute()]);
          }
        },
        builder: (BuildContext context, state) {
          if (state.status.isLoading) {
            return const Loading();
          } else {
            return const AuthorizationBody();
          }
        },
      ),
    );
  }
}
