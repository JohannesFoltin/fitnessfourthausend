// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exerciseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseData _$ExerciseDataFromJson(Map<String, dynamic> json) => ExerciseData(
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      pictureAsset: json['pictureAsset'] as String? ?? "",
      notes: json['notes'] as String? ?? "",
      unit: json['unit'] as String? ?? "",
      type: json['type'] as String? ?? "",
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExerciseDataToJson(ExerciseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pictureAsset': instance.pictureAsset,
      'notes': instance.notes,
      'unit': instance.unit,
      'type': instance.type,
    };
