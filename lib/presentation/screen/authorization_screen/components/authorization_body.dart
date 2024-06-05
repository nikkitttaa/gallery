part of presentation_authorization;

class AuthorizationBody extends StatefulWidget {
  const AuthorizationBody({
    super.key,
  });

  @override
  State<AuthorizationBody> createState() => _AuthorizationBodyState();
}

class _AuthorizationBodyState extends State<AuthorizationBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 112,
          left: 16,
          right: 16,
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 60,
                  top: 8,
                ),
                child: UnderlinedText(
                  text: context.localization.signIn,
                  underlineOffset: 8,
                  textStyle: AppThemeData.splashBoldText,
                  underlineColor: AppColors.main,
                ),
              ),
              AuthorizationInputs(
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthorizationBloc>().add(
                        AuthorizationEvent.signIn(
                          password: passwordController.text,
                          email: emailController.text,
                        ),
                      );
                },
                child: Text(
                  context.localization.signInBtn,
                  style: AppThemeData.btnText,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.router.push(const RegistrationRoute());
                },
                child: Text(
                  context.localization.signUpBtn,
                  style: AppThemeData.btnText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
