library presentation_add_media;

import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/presentation/extension/app_localization_extension.dart';
import 'package:gallery/presentation/resources/part_resources.dart';
import 'package:gallery/presentation/routing/router.dart';
import 'package:gallery/presentation/theme/part_theme.dart';
import 'package:gallery/presentation/widget/part_widget.dart';
import 'package:image_picker/image_picker.dart';

part './add_media_screen.dart';

part 'components/add_media_body.dart';

part 'bloc/add_media_bloc.dart';

part 'bloc/add_media_event.dart';

part 'bloc/add_media_state.dart';

part 'add_media_part.freezed.dart';

part 'components/pick_image_container.dart';
