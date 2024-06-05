part of presentation_main;

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isAddPhotoRouteActive = false;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        AddMediaRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcon.home,
                  color: AppColors.gray,
                ),
                activeIcon: Image.asset(
                  AppIcon.home,
                  color: AppColors.main,
                ),
                label: AppConst.empty,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcon.camera,
                  color: isAddPhotoRouteActive ? AppColors.main : AppColors.gray,
                ),
                activeIcon: Image.asset(
                  AppIcon.camera,
                  color: AppColors.main,
                ),
                label: AppConst.empty,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcon.profile,
                  color: AppColors.gray,
                ),
                activeIcon: Image.asset(
                  AppIcon.profile,
                  color: AppColors.main,
                ),
                label: AppConst.empty,
              ),
            ],
          ),
        );
      },
    );
  }
}
