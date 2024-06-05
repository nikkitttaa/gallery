library presentation_new_photo;

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/presentation/extension/app_localization_extension.dart';
import 'package:gallery/presentation/extension/scroll_notification_extension.dart';
import 'package:gallery/presentation/resources/part_resources.dart';
import 'package:gallery/presentation/routing/router.dart';
import 'package:gallery/presentation/theme/part_theme.dart';
import 'package:gallery/presentation/widget/part_widget.dart';

part './new_photo_screen.dart';

part './bloc/new_photo_bloc.dart';

part './bloc/new_photo_event.dart';

part './bloc/new_photo_state.dart';

part 'new_photo_part.freezed.dart';

part 'components/photo_body.dart';
