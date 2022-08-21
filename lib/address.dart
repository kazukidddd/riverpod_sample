import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class AddressJsonObject with _$AddressJsonObject {
  const factory AddressJsonObject({
    @JsonKey(name: 'address1') required String address1,
    @JsonKey(name: 'address2') required String address2,
    @JsonKey(name: 'address3') required String address3,
    @JsonKey(name: 'kana1') required String kana1,
    @JsonKey(name: 'kana2') required String kana2,
    @JsonKey(name: 'kana3') required String kana3,
    @JsonKey(name: 'prefcode') required String prefcode,
    @JsonKey(name: 'zipcode') required String zipcode,
  }) = _AddressJsonObject;

  factory AddressJsonObject.fromJson(Map<String, dynamic> json) =>
      _$AddressJsonObjectFromJson(json);
}
