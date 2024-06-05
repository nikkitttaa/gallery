part of data;

@freezed
class PhotoRequestDTO with _$PhotoRequestDTO {
  const factory PhotoRequestDTO({
    required int page,
    required int limit,
    @JsonKey(includeIfNull: false, name: 'new') bool? isNew,
    @JsonKey(includeIfNull: false, name: 'popular') bool? isPopular,
    @JsonKey(includeIfNull: false, name: 'order[id]') String? orderId,
    @JsonKey(includeIfNull: false, name: 'name') String? name,
    @JsonKey(includeIfNull: false, name: 'user.id') int? userId,
    @JsonKey(includeIfNull: false, name: 'user.id[]') List<int>? userIds,
  }) = _PhotoRequestDTO;

  factory PhotoRequestDTO.fromJson(Map<String, dynamic> json) => _$PhotoRequestDTOFromJson(json);
}
