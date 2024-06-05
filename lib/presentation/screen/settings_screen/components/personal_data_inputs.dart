part of presentation_settings;

class PersonalDataInputs extends StatefulWidget {
  const PersonalDataInputs({
    super.key,
    required this.user,
    required this.usernameController,
    required this.birthdayController,
    required this.emailController,
    required this.phoneController,
  });

  final UserModel user;
  final TextEditingController usernameController;
  final TextEditingController birthdayController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  State<PersonalDataInputs> createState() => _PersonalDataInputsState();
}

class _PersonalDataInputsState extends State<PersonalDataInputs> {
  @override
  void initState() {
    final DateTime? birthday = widget.user.birthday;
    String? day;
    String? month;
    widget.usernameController.text = widget.user.userName;
    if (birthday != null) {
      day = birthday.day.toString();
      if (birthday.day < 10) day = '0${birthday.day}';
      month = birthday.month.toString();
      if (birthday.month < 10) month = '0${birthday.month}';
    }
    final String birthdayStr = '$day.$month.${birthday?.year}';
    widget.birthdayController.text = widget.user.birthday.toString() != 'null' ? birthdayStr : AppConst.empty;
    widget.emailController.text = widget.user.email;
    widget.phoneController.text = widget.user.phone.toString();
    super.initState();
  }

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
      widget.birthdayController.text = formatter.format(birthday);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseInput(
          controller: widget.usernameController,
          labelText: context.localization.usernameInput,
          icon: AppIcon.person,
          field: Field.username,
        ),
        BaseInput(
          controller: widget.birthdayController,
          labelText: context.localization.birthdayInput,
          icon: AppIcon.calendar,
          isDate: true,
          onPressed: () {
            _selectDate(context);
          },
          field: Field.birthday,
        ),
        BaseInput(
          controller: widget.emailController,
          labelText: context.localization.emailInput,
          icon: AppIcon.mail,
          field: Field.email,
        ),
        BaseInput(
          controller: widget.phoneController,
          labelText: context.localization.phoneInput,
          icon: AppIcon.phone,
          field: Field.phone,
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.usernameController.dispose();
    widget.birthdayController.dispose();
    widget.emailController.dispose();
    widget.phoneController.dispose();
    super.dispose();
  }
}
