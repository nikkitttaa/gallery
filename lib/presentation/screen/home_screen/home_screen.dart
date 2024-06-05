part of presentation_home;

@RoutePage()
class HomeStackScreen extends StatelessWidget {
  const HomeStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewPhotoBloc(
            mediaUseCase: locator(),
          )..add(
              const NewPhotoEvent.getPhoto(
                limit: AppConst.limitOfMedia,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => PopularPhotoBloc(
            mediaUseCase: locator(),
          )..add(
              const PopularPhotoEvent.getPhoto(
                limit: AppConst.limitOfMedia,
              ),
            ),
        ),
      ],
      child: this,
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController inputController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  final TokenRepository tokenRepository = locator();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseSearchBar(
          tabController: _tabController,
          searchController: searchController,
          onSuffixTap: () {
            searchController.clear();
            FocusScope.of(context).unfocus();
            context.read<NewPhotoBloc>().add(
                  const NewPhotoEvent.getPhoto(
                    clearPhoto: true,
                    limit: AppConst.limitOfMedia,
                  ),
                );
            context.read<PopularPhotoBloc>().add(
                  const PopularPhotoEvent.getPhoto(
                    clearPhoto: true,
                    limit: AppConst.limitOfMedia,
                  ),
                );
          },
        ),
        bottom: CustomTabBar(
          controller: _tabController,
          onTap: () {
            searchController.clear();
            FocusScope.of(context).unfocus();
           if(_tabController.index == 0){
             context.read<NewPhotoBloc>().add(
               const NewPhotoEvent.getPhoto(
                 clearPhoto: true,
                 limit: AppConst.limitOfMedia,
               ),
             );
           }
            if (_tabController.index == 1) {
              context.read<PopularPhotoBloc>().add(
                    const PopularPhotoEvent.getPhoto(
                      clearPhoto: true,
                      limit: AppConst.limitOfMedia,
                    ),
                  );
            }
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NewPhotoScreen(
            searchController: searchController,
          ),
          PopularPhotoScreen(
            searchController: searchController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    _tabController.dispose();
    inputController.dispose();
    super.dispose();
  }
}
