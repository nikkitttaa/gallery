part of presentation_registration;

class RegistrationInputs extends StatelessWidget {
  const RegistrationInputs({
    super.key,
    required this.usernameController,
    required this.birthdayController,
    required this.phoneNumberController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController usernameController;
  final TextEditingController? birthdayController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final DateFormat formatter = DateFormat('dd.MM.yyyy');
      final DateTime birthday = picked;
      birthdayController!.text = formatter.format(birthday);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Column(
          children: [
            BaseInput(
              controller: usernameController,
              labelText: context.localization.usernameInput,
              icon: AppIcon.person,
              isRequired: true,
              field: Field.username,
              errorText: state.errors[Field.username]?.getLocalizedErrorMessage(context.localization),
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                      RegistrationEvent.validateUsername(
                        username: usernameController.text,
                      ),
                    );
              },
            ),
            BaseInput(
              controller: birthdayController,
              labelText: context.localization.birthdayInput,
              icon: AppIcon.calendar,
              isDate: true,
              field: Field.birthday,
              errorText: state.errors[Field.birthday]?.getLocalizedErrorMessage(context.localization),
              onPressed: () {
                _selectDate(context);
              },
            ),
            BaseInput(
              controller: phoneNumberController,
              labelText: context.localization.phoneInput,
              icon: AppIcon.phone,
              isRequired: true,
              isPhoneNumber: true,
              field: Field.phone,
              errorText: state.errors[Field.phone]?.getLocalizedErrorMessage(context.localization),
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                      RegistrationEvent.validatePhone(
                        phone: phoneNumberController.text,
                      ),
                    );
              },
            ),
            BaseInput(
              controller: emailController,
              labelText: context.localization.emailInput,
              icon: AppIcon.mail,
              isRequired: true,
              field: Field.email,
              errorText: state.errors[Field.email]?.getLocalizedErrorMessage(context.localization),
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                      RegistrationEvent.validateEmail(
                        email: emailController.text,
                      ),
                    );
              },
            ),
            BaseInput(
              controller: passwordController,
              labelText: context.localization.passwordInput,
              isRequired: true,
              isPassword: true,
              field: Field.password,
              errorText: state.errors[Field.password]?.getLocalizedErrorMessage(context.localization),
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                      RegistrationEvent.validatePassword(
                        password: passwordController.text,
                      ),
                    );
              },
            ),
            BaseInput(
              controller: confirmPasswordController,
              labelText: context.localization.confirmPasswordInput,
              isRequired: true,
              isPassword: true,
              field: Field.confirmPassword,
              passwordController: passwordController,
              errorText: state.errors[Field.confirmPassword]?.getLocalizedErrorMessage(context.localization),
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                      RegistrationEvent.validateConfirmPassword(
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
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
