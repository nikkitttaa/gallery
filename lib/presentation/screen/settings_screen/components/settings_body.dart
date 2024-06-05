part of presentation_settings;

class SettingBody extends StatefulWidget {
  const SettingBody({
    super.key,
    required this.user,
  });

  final UserModel? user;

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.appBar(
        action: context.localization.save,
        onLeadingTap: () {
          context.router.maybePop();
        },
        onActionTap: () {
          context.read<SettingsBloc>().add(
                SettingsEvent.updateUser(
                  username: usernameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  birthday: DateTime.tryParse(birthdayController.text),
                  oldPassword: oldPasswordController.text,
                  newPassword: newPasswordController.text,
                  confirmNewPassword: confirmNewPasswordController.text,
                ),
              );
        },
        icon: AppIcon.back,
        leadingText: context.localization.cancel,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<SettingsBloc>().add(
                  const SettingsEvent.loadInfo(),
                );
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localization.personalData,
                    style: SettingsTextTheme.title,
                  ),
                  PersonalDataInputs(
                    user: widget.user!,
                    usernameController: usernameController,
                    birthdayController: birthdayController,
                    emailController: emailController,
                    phoneController: phoneController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    context.localization.password,
                    style: SettingsTextTheme.title,
                  ),
                  PasswordInputs(
                    oldPasswordController: oldPasswordController,
                    newPasswordController: newPasswordController,
                    confirmNewPasswordController: confirmNewPasswordController,
                  ),
                  const SetLanguage(),
                  const InfoTextButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
