part of presentation_check_auth;

@RoutePage()
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(
        userRepository: locator(),
        authUseCase: locator(),
      )..add(const SplashEvent.started()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.status.isInitial) {
            return;
          } else if (state.status.isLoggedIn) {
            context.router.replace(
              const HomeRoute(),
            );
          } else {
            context.router.replace(
              const UnboardingRoute(),
            );
          }
        },
        child: const Loading(),
      ),
    );
  }
}
