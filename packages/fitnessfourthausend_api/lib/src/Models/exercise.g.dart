// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      ExerciseData.fromJson(json['uebung'] as Map<String, dynamic>),
      (json['sets'] as List<dynamic>)
          .map((e) => ExerciseSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isChecked'] as bool,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'uebung': instance.uebung,
      'sets': instance.sets,
      'isChecked': instance.isChecked,
    };
