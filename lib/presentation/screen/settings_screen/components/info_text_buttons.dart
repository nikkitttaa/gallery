part of presentation_settings;

class InfoTextButtons extends StatelessWidget {
  const InfoTextButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.localization.youCan,
                style: SettingsTextTheme.title,
              ),
              GestureDetector(
                onTap: () {
                  AppAboutDialog.showAppAboutDialog(
                    context: context,
                    title: context.localization.deleteTitle,
                    content: context.localization.deleteDescription,
                    btn1Text: context.localization.yes,
                    btn2Text: context.localization.no,
                    onFirstButtonClick: () {
                      context.read<SettingsBloc>().add(const SettingsEvent.deleteUser());
                    },
                    onSecondButtonClick: () {
                      context.router.maybePop();
                    },
                  );
                },
                child: Text(
                  context.localization.deleteAccount,
                  style: SettingsTextTheme.textButton,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 14,
            bottom: 40,
          ),
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                AppAboutDialog.showAppAboutDialog(
                  context: context,
                  title: context.localization.signOut,
                  content: context.localization.signOutDescription,
                  btn1Text: context.localization.yes,
                  btn2Text: context.localization.no,
                  onFirstButtonClick: () {
                    context.read<SettingsBloc>().add(const SettingsEvent.signOut());
                    context.router.replaceAll([const UnboardingRoute()]);
                  },
                  onSecondButtonClick: () {
                    context.router.maybePop();
                  },
                );
              },
              child: Text(
                context.localization.signOut,
                style: SettingsTextTheme.textButton,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
