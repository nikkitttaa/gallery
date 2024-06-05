library presentation_full_media_screen;

import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/presentation/extension/date_format_extension.dart';
import 'package:gallery/presentation/extension/app_localization_extension.dart';
import 'package:gallery/presentation/resources/part_resources.dart';
import 'package:gallery/presentation/theme/part_theme.dart';
import 'package:gallery/presentation/widget/part_widget.dart';

part 'full_media_screen.dart';

part 'bloc/full_media_bloc.dart';

part 'bloc/full_media_state.dart';

part 'bloc/full_media_event.dart';

part 'part_full_media_screen.freezed.dart';

part 'components/full_media_body.dart';

part 'components/full_image.dart';
