part of presentation_registration;

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({
    super.key,
  });

  @override
  State<RegistrationBody> createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    birthdayController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 60,
                  top: 30,
                ),
                child: UnderlinedText(
                  text: context.localization.signUp,
                  underlineOffset: 8,
                  textStyle: AppThemeData.splashBoldText,
                  underlineColor: AppColors.main,
                ),
              ),
              RegistrationInputs(
                usernameController: usernameController,
                birthdayController: birthdayController,
                phoneNumberController: phoneController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<RegistrationBloc>().add(
                        RegistrationEvent.singUp(
                          email: emailController.text,
                          password: passwordController.text,
                          username: usernameController.text,
                          phone: phoneController.text,
                          confirmPassword: confirmPasswordController.text,
                          birthday: DateTime.tryParse(birthdayController.text),
                        ),
                      );
                },
                child: Text(
                  context.localization.signUpBtn,
                  style: AppThemeData.btnText,
                ),
              ),
              TextButton(
                onPressed: () {
                  AutoRouter.of(context).push(const AuthorizationRoute());
                },
                child: Text(
                  context.localization.signInBtn,
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
