library presentation_popular_photo;

import 'dart:async';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/presentation/extension/app_localization_extension.dart';
import 'package:gallery/presentation/extension/scroll_notification_extension.dart';
import 'package:gallery/presentation/screen/new_photo_screen/new_photo_part.dart';
import 'package:gallery/presentation/theme/part_theme.dart';
import 'package:gallery/presentation/widget/part_widget.dart';

part './popular_photo_screen.dart';

part './bloc/popular_photo_bloc.dart';

part './bloc/popular_photo_event.dart';

part './bloc/popular_photo_state.dart';

part 'popular_photo_part.freezed.dart';
