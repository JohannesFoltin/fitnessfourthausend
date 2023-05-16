// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      exerciseData:
          ExerciseData.fromJson(json['exerciseData'] as Map<String, dynamic>),
      sets: (json['sets'] as List<dynamic>?)
              ?.map((e) => ExerciseSet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isChecked: json['isChecked'] as bool? ?? false,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'exerciseData': instance.exerciseData,
      'sets': instance.sets,
      'isChecked': instance.isChecked,
    };
