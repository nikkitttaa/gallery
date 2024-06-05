part of presentation_theme;

class AppTextFieldTheme {
  static InputDecoration getInputDecoration({
    required String labelText,
    required String? errorText,
    required context,
    required String? icon,
    required bool isRequired,
    required VoidCallback onPressed,
    required bool isPassword,
    required bool isDate,
  }) {
    return InputDecoration(
      counterText: '',
      label: Text.rich(
        TextSpan(
          text: labelText,
          children: [
            TextSpan(
                text: isRequired ? '*' : '',
                style: const TextStyle(
                  color: AppColors.errorRed,
                ))
          ],
        ),
      ),
      labelStyle: AppThemeData.labelInputStyle,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.errorRed),
      ),
      suffixIcon: icon != null
          ? isPassword
              ? IconButton(
                  icon: Image.asset(icon),
                  onPressed: onPressed,
                )
              : isDate
                  ? IconButton(
                      icon: Image.asset(icon),
                      onPressed: onPressed,
                    )
                  : Image.asset(icon)
          : null,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grayLight),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.errorRed),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.009,
        horizontal: MediaQuery.sizeOf(context).width * 0.02,
      ),
      errorText: errorText == '' ? null : errorText,
    );
  }
}
