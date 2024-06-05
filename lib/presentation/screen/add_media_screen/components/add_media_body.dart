part of presentation_add_media;

class AddMediaBody extends StatefulWidget {
  const AddMediaBody({
    super.key,
  });

  @override
  State<AddMediaBody> createState() => _AddMediaBodyState();
}

class _AddMediaBodyState extends State<AddMediaBody> {
  String? img;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayLight,
      appBar: BaseAppBar.appBar(
        action: context.localization.next,
        onLeadingTap: () {
          AppAboutDialog.showAppAboutDialog(
            context: context,
            title: context.localization.confirmation,
            content: context.localization.textConfirmBack,
            btn1Text: context.localization.exit,
            btn2Text: context.localization.cancel,
            onFirstButtonClick: () {
              context.router.maybePop();
              setState(() {
                img = null;
                nameController.clear();
                descriptionController.clear();
              });
              context.router.replaceAll([const HomeRoute()]);
            },
            onSecondButtonClick: () {
              context.router.maybePop();
            },
          );
        },
        icon: AppIcon.back,
        leadingText: context.localization.back,
        onActionTap: () {
          context.read<AddMediaBloc>().add(
                AddMediaEvent.addMedia(
                  image: img,
                  name: nameController.text,
                  description: descriptionController.text,
                ),
              );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PickImageContainer(
                img: img,
                onTap: () {
                  AppAboutDialog.showAppAboutDialog(
                    context: context,
                    title: context.localization.addPhoto,
                    content: context.localization.addPhotoDesc,
                    btn1Text: context.localization.camera,
                    btn2Text: context.localization.gallery,
                    onFirstButtonClick: () {
                      getImageFromCamera();
                      context.router.maybePop();
                    },
                    onSecondButtonClick: () {
                      getImageFromGallery();
                      context.router.maybePop();
                    },
                  );
                },
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 25,
                  bottom: MediaQuery.sizeOf(context).height * 0.1,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                    top: BorderSide(width: 1, color: AppColors.gray),
                  ),
                ),
                child: Column(
                  children: [
                    BaseInput(
                      controller: nameController,
                      labelText: context.localization.name,
                    ),
                    BaseInput(
                      controller: descriptionController,
                      labelText: context.localization.description,
                      minLines: 5,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future getImageFromCamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      img = image!.path;
    });
  }

  Future getImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      img = image!.path;
    });
  }
}
