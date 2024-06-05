part of presentation_profile;

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    super.key,
    required this.username,
    required this.birthday,
  });

  final String username;
  final DateTime? birthday;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                border: const Border(
                  top: BorderSide(
                    color: AppColors.grayLight,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: AppColors.grayLight,
                    width: 2,
                  ),
                  left: BorderSide(
                    color: AppColors.grayLight,
                    width: 2,
                  ),
                  right: BorderSide(
                    color: AppColors.grayLight,
                    width: 2,
                  ),
                ),
              ),
              child: Image.asset(
                AppImage.logo,
                height: 70,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: ProfileTextTheme.title,
              ),
              Text(
                birthday?.formatDate() ?? context.localization.undefined,
                style: ProfileTextTheme.date,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
