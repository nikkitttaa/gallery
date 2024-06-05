part of presentation_authorization;

class AuthorizationInputs extends StatefulWidget implements AutoRouteWrapper {
  const AuthorizationInputs({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;

  final TextEditingController passwordController;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBloc(
        authUseCase: locator(),
      ),
      child: this,
    );
  }

  @override
  State<AuthorizationInputs> createState() => _AuthorizationInputsState();
}

class _AuthorizationInputsState extends State<AuthorizationInputs> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state) {
        return Column(
          children: [
            BaseInput(
              controller: widget.emailController,
              labelText: context.localization.emailInput,
              icon: AppIcon.mail,
              isRequired: true,
              errorText: state.errors[Field.email]?.getLocalizedErrorMessage(context.localization),
              field: Field.email,
              onChanged: (value) {
                context.read<AuthorizationBloc>().add(
                      AuthorizationEvent.validateEmail(
                        email: value,
                      ),
                    );
              },
            ),
            BaseInput(
              controller: widget.passwordController,
              labelText: context.localization.passwordInput,
              isRequired: true,
              isPassword: true,
              errorText: state.errors[Field.password]?.getLocalizedErrorMessage(context.localization),
              field: Field.password,
              onChanged: (value) {
                context.read<AuthorizationBloc>().add(
                      AuthorizationEvent.validatePassword(
                        password: value,
                      ),
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
