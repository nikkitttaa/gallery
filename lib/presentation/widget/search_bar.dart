part of presentation_widget;

class BaseSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const BaseSearchBar({
    super.key,
    required this.tabController,
    required this.searchController,
    required this.onSuffixTap,
  });

  final TextEditingController searchController;
  final TabController tabController;
  final VoidCallback onSuffixTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<BaseSearchBar> createState() => _BaseSearchBarState();
}

class _BaseSearchBarState extends State<BaseSearchBar> {
  bool _showCancel = false;

  final Debouncer debouncer = Debouncer(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      border: const Border(
        left: BorderSide.none,
        right: BorderSide.none,
        top: BorderSide.none,
        bottom: BorderSide.none,
      ),
      backgroundColor: Colors.transparent,
      middle: CupertinoSearchTextField(
        controller: widget.searchController,
        prefixIcon: Image.asset(
          AppIcon.search,
          scale: 1.5,
        ),
        suffixIcon: const Icon(
          CupertinoIcons.xmark_circle_fill,
          size: 15,
          color: AppColors.gray,
        ),
        onSuffixTap: widget.onSuffixTap,
        onChanged: (value) {
          if (widget.tabController.index == 0) {
            debouncer.run(
              () {
                context.read<NewPhotoBloc>().add(
                      NewPhotoEvent.getPhoto(
                        name: widget.searchController.text,
                        limit: AppConst.limitOfMedia,
                        clearPhoto: true,
                      ),
                    );
              },
            );
          } else if (widget.tabController.index == 1) {
            debouncer.run(
              () {
                context.read<PopularPhotoBloc>().add(
                      PopularPhotoEvent.getPhoto(
                        name: widget.searchController.text,
                        limit: AppConst.limitOfMedia,
                        clearPhoto: true,
                      ),
                    );
              },
            );
          }
        },
      ),
      trailing: _showCancel
          ? CupertinoButton(
              padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).shortestSide * 0.015),
              onPressed: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                  _showCancel = false;
                });
              },
              child: Text(
                context.localization.cancel,
                style: AppThemeData.appBarText,
              ),
            )
          : null,
    );
  }

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    widget.searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {
      _showCancel = widget.searchController.text.isNotEmpty;
    });
  }
}
