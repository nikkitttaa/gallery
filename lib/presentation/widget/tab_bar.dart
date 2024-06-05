part of presentation_widget;

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? controller;
  final VoidCallback onTap;

  const CustomTabBar({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar.secondary(
      controller: controller,
      tabs: [
        Tab(
          child: Text(
            AppLocalization.of(context).neww,
            style: AppThemeData.textStyleTabBar,
          ),
        ),
        Tab(
          child: Text(
            AppLocalization.of(context).popular,
            style: AppThemeData.textStyleTabBar,
          ),
        ),
      ],
      onTap: (value){
        onTap();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
