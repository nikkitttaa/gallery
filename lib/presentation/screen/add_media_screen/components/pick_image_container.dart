part of presentation_add_media;

class PickImageContainer extends StatefulWidget {
  PickImageContainer({
    super.key,
    required this.img,
    required this.onTap,
  });

  String? img;
  final VoidCallback onTap;

  @override
  State<PickImageContainer> createState() => _PickImageContainerState();
}

class _PickImageContainerState extends State<PickImageContainer> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.img == null
            ? Container(
                color: AppColors.gray,
                height: 280,
                width: double.infinity,
                child: Center(
                  child: Text(
                    context.localization.selectClick,
                    style: AddMediaTextTheme.confirmDescription,
                  ),
                ),
              )
            : Image.file(
                File(widget.img!),
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
