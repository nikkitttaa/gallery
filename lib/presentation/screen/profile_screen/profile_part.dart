library presentation_profile;

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/presentation/extension/date_format_extension.dart';
import 'package:gallery/presentation/extension/app_localization_extension.dart';
import 'package:gallery/presentation/extension/scroll_notification_extension.dart';
import 'package:gallery/presentation/resources/part_resources.dart';
import 'package:gallery/presentation/routing/router.dart';
import 'package:gallery/presentation/screen/full_media_screen/part_full_media_screen.dart';
import 'package:gallery/presentation/screen/new_photo_screen/new_photo_part.dart';
import 'package:gallery/presentation/theme/part_theme.dart';
import 'package:gallery/presentation/widget/part_widget.dart';

part './profile_screen.dart';

part 'components/profile_body.dart';

part 'bloc/profile_bloc.dart';

part 'bloc/profile_event.dart';

part 'bloc/profile_state.dart';

part 'profile_part.freezed.dart';

part 'components/user_info_container.dart';

part 'components/user_media_grid.dart';

part 'components/full_user_media.dart';
