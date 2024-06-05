part of presentation_unboarding;

@RoutePage()
class UnboardingScreen extends StatelessWidget {
  const UnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImage.logo,
              ),
              Text(
                context.localization.welcomeText,
                textAlign: TextAlign.center,
                style: AppThemeData.splashBoldText,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 80),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.push(const RegistrationRoute());
                    },
                    child: Text(
                      context.localization.createAccount,
                      style: AppThemeData.btnText,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    context.router.push(const AuthorizationRoute());
                  },
                  child: Text(
                    context.localization.haveAccount,
                    style: AppThemeData.btnText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
