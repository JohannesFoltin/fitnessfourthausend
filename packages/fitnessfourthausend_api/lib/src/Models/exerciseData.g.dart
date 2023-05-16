// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exerciseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseData _$ExerciseDataFromJson(Map<String, dynamic> json) => ExerciseData(
      json['name'] as String,
      json['description'] as String,
      json['pictureAsset'] as String,
      json['typ'] as String,
      json['notes'] as String,
      json['unit'] as String,
      json['maximum'] as int,
    );

Map<String, dynamic> _$ExerciseDataToJson(ExerciseData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'pictureAsset': instance.pictureAsset,
      'notes': instance.notes,
      'unit': instance.unit,
      'typ': instance.typ,
      'maximum': instance.maximum,
    };
