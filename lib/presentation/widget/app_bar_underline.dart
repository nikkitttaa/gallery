part of presentation_widget;

class AppBarWithUnderline extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final double leadingWidth;
  final double underlineWidth;
  final double toolbarHeight;
  final Color underlineColor;

  const AppBarWithUnderline({
    super.key,
    required this.title,
    required this.underlineColor,
    required this.leading,
    required this.leadingWidth,
    required this.underlineWidth,
    required this.toolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(title),
          elevation: 0,
          leadingWidth: leadingWidth,
          toolbarHeight: toolbarHeight,
          leading: leading,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: underlineColor,
                width: underlineWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
