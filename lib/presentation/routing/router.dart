import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:gallery/presentation/screen/add_media_screen/add_media_part.dart';
import 'package:gallery/presentation/screen/authorization_screen/authorization_part.dart';
import 'package:gallery/presentation/screen/full_media_screen/part_full_media_screen.dart';
import 'package:gallery/presentation/screen/home_screen/home_part.dart';
import 'package:gallery/presentation/screen/main_screen/main_part.dart';
import 'package:gallery/presentation/screen/profile_screen/profile_part.dart';
import 'package:gallery/presentation/screen/registration_screen/registration_part.dart';
import 'package:gallery/presentation/screen/settings_screen/part_setting.dart';
import 'package:gallery/presentation/screen/splash/part_splash.dart';
import 'package:gallery/presentation/screen/unboarding_screen/unboarding_part.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(page: AuthorizationRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(
              page: HomeStackRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page),
                AutoRoute(page: AddMediaRoute.page),
              ],
            ),
            AutoRoute(page: AddMediaRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(
          page: UnboardingRoute.page,
        ),
        AutoRoute(page: AddMediaRoute.page),
        AutoRoute(page: FullMediaRoute.page),
        AutoRoute(page: SettingRoute.page),
        AutoRoute(page: FullUserMediaRoute.page)
      ];
}
