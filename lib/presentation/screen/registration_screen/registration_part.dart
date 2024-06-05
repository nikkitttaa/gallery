library presentation_registration;

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/presentation/extension/app_localization_extension.dart';
import 'package:gallery/presentation/extension/field_error_extension.dart';
import 'package:gallery/presentation/helpers/field_validation.dart';
import 'package:gallery/presentation/resources/app_enums.dart';
import 'package:gallery/presentation/resources/part_resources.dart';
import 'package:gallery/presentation/routing/router.dart';
import 'package:gallery/presentation/theme/part_theme.dart';
import 'package:gallery/presentation/widget/part_widget.dart';
import 'package:intl/intl.dart';

part './registration_screen.dart';

part './bloc/registration_bloc.dart';

part './bloc/registration_event.dart';

part './bloc/registration_state.dart';

part 'components/registration_inputs.dart';

part 'components/registration_body.dart';

part 'registration_part.freezed.dart';
