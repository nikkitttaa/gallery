part of presentation_settings;

class SetLanguage extends StatelessWidget {
  const SetLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localization.language,
            style: SettingsTextTheme.title,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  context.read<SettingsBloc>().add(
                        const SettingsEvent.switchLanguage(
                          locale: AppConst.enLocale,
                        ),
                      );
                },
                child: Text(
                  context.localization.english,
                  style: SettingsTextTheme.textButton,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<SettingsBloc>().add(
                        const SettingsEvent.switchLanguage(
                          locale: AppConst.ruLocale,
                        ),
                      );
                },
                child: Text(
                  context.localization.russian,
                  style: SettingsTextTheme.textButton,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
