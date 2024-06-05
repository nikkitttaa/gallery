import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gallery/generated/l10n.dart';
import 'package:gallery/presentation/routing/router.dart';
import 'package:gallery/presentation/screen/settings_screen/part_setting.dart';
import 'package:gallery/presentation/theme/part_theme.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDependencies();
  await initializeDateFormatting('ru');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  String locale = AppConst.ruLocale;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        userUseCase: locator(),
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          context.read<SettingsBloc>().add(const SettingsEvent.getLocale());
          locale = state.locale;

          return MaterialApp.router(
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalization.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.mainTheme,
            routerConfig: _appRouter.config(),
            locale: Locale(locale),
          );
        },
      ),
    );
  }
}
