part of presentation_widget;

class BaseLeading extends StatelessWidget {
  const BaseLeading({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            icon,
            color: AppColors.blue,
          ),
          Text(
            text,
            style: AppThemeData.appBarText,
          ),
        ],
      ),
    );
  }
}
