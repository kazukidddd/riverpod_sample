// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressJsonObject _$$_AddressJsonObjectFromJson(Map<String, dynamic> json) =>
    _$_AddressJsonObject(
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      address3: json['address3'] as String,
      kana1: json['kana1'] as String,
      kana2: json['kana2'] as String,
      kana3: json['kana3'] as String,
      prefcode: json['prefcode'] as String,
      zipcode: json['zipcode'] as String,
    );

Map<String, dynamic> _$$_AddressJsonObjectToJson(
        _$_AddressJsonObject instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'kana1': instance.kana1,
      'kana2': instance.kana2,
      'kana3': instance.kana3,
      'prefcode': instance.prefcode,
      'zipcode': instance.zipcode,
    };
