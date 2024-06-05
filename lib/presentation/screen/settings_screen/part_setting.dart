library presentation_settings;

import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/presentation/extension/app_localization_extension.dart';
import 'package:gallery/presentation/resources/app_enums.dart';
import 'package:gallery/presentation/resources/part_resources.dart';
import 'package:gallery/presentation/routing/router.dart';
import 'package:gallery/presentation/theme/part_theme.dart';
import 'package:gallery/presentation/widget/part_widget.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_screen.dart';

part 'bloc/settings_bloc.dart';

part 'bloc/settings_event.dart';

part 'bloc/settings_state.dart';

part 'part_setting.freezed.dart';

part 'components/settings_body.dart';

part 'components/password_inputs.dart';

part 'components/personal_data_inputs.dart';

part 'components/set_language.dart';

part 'components/info_text_buttons.dart';
