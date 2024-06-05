part of presentation_settings;

class PasswordInputs extends StatefulWidget {
  const PasswordInputs({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmNewPasswordController,
  });

  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPasswordController;

  @override
  State<PasswordInputs> createState() => _PasswordInputsState();
}

class _PasswordInputsState extends State<PasswordInputs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseInput(
          controller: widget.oldPasswordController,
          labelText: 'Old password',
          isPassword: true,
          field: Field.password
        ),
        BaseInput(
          controller: widget.newPasswordController,
          labelText: 'New Password',
          isPassword: true,
          field: Field.password,
        ),
        BaseInput(
          controller: widget.confirmNewPasswordController,
          labelText: context.localization.confirmPasswordInput,
          isPassword: true,
          field: Field.confirmPassword,
          passwordController: widget.newPasswordController,
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.oldPasswordController.dispose();
    widget.newPasswordController.dispose();
    widget.confirmNewPasswordController.dispose();
    super.dispose();
  }
}
