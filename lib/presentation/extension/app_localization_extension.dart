import 'package:flutter/material.dart';
import 'package:gallery/generated/l10n.dart';

extension BuildContextExtension on BuildContext {
  AppLocalization get localization => AppLocalization.of(this);
}
