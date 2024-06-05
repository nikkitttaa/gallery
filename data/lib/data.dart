library data;

import 'dart:io';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part './interceptors/interceptor.dart';

part './repository/auth_repository_impl.dart';

part './repository/token_repository_impl.dart';

part 'data.freezed.dart';

part 'data.g.dart';

part './repository/media_repository_impl.dart';

part 'repository/user_repository_impl.dart';

part 'dto/request/media_object_request.dart';

part 'dto/request/photos_request.dart';

part 'dto/request/registration_request.dart';

part 'dto/request/update_password_request.dart';

part 'dto/request/update_user_request.dart';

part 'dto/image_dto.dart';

part 'dto/media_dto.dart';

part 'dto/token_dto.dart';

part 'dto/update_password_dto.dart';

part 'dto/user_dto.dart';

part 'dto/wrappers_dto.dart';

part 'services/auth_service.dart';

part 'services/media_service.dart';

part 'services/user_service.dart';

part 'dto/request/photo_request_dto.dart';
