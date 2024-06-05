part of presentation_widget;

class BaseInput extends StatefulWidget {
  BaseInput({
    super.key,
    required this.controller,
    required this.labelText,
    this.isRequired = false,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.isDate = false,
    this.errorText,
    this.onPressed,
    this.icon,
    this.minLines,
    this.maxLines,
    this.field,
    this.passwordController,
    this.onChanged,
  });

  final TextEditingController? controller;
  final TextEditingController? passwordController;
  final String labelText;
  String? errorText;
  final String? icon;
  final bool isRequired;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool isDate;
  final VoidCallback? onPressed;
  final int? minLines;
  final int? maxLines;
  final Field? field;
  final void Function(String)? onChanged;

  @override
  State<BaseInput> createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextField(
        onChanged: widget.onChanged,
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines,
        controller: widget.controller,
        style: AppThemeData.textInputStyle,
        obscureText: widget.isPassword ? obscure : false,
        maxLength: widget.isPhoneNumber ? 18 : 1000,
        inputFormatters: [
          widget.isPhoneNumber
              ? AppConst.phoneMask
              : widget.isDate
                  ? AppConst.dateMask
                  : FilteringTextInputFormatter.singleLineFormatter,
        ],
        decoration: AppTextFieldTheme.getInputDecoration(
          labelText: widget.labelText,
          context: context,
          icon: widget.isPassword == true
              ? obscure
                  ? AppIcon.eyeOn
                  : AppIcon.eyeOff
              : widget.icon,
          isRequired: widget.isRequired,
          onPressed: widget.isPassword
              ? () => setState(() => obscure = !obscure)
              : widget.onPressed != null
                  ? widget.onPressed!
                  : () {},
          isPassword: widget.isPassword,
          errorText: widget.errorText,
          isDate: widget.isDate,
        ),
      ),
    );
  }
}
