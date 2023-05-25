import 'package:equatable/equatable.dart';
import 'package:trainings_api/training_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'exercise.g.dart';

@immutable
@JsonSerializable()
class Exercise extends Equatable{
  final ExerciseData exerciseData;
  final List<ExerciseSet> sets;

  Exercise({required this.exerciseData, this.sets = const [],});

    factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);



  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  Exercise copyWith(
    {
      ExerciseData? exerciseData,
      List<ExerciseSet>? sets,
    }
  ){
    return Exercise(
      exerciseData: exerciseData ?? this.exerciseData,
      sets: sets ?? this.sets,
    );
  }
  @override
  List<Object> get props => [exerciseData];
}