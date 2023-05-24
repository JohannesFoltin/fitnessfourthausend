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
  final bool isChecked;

  Exercise({required this.exerciseData, this.sets = const [],this.isChecked = false});

    factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);



  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  Exercise copyWith(
    {
      ExerciseData? exerciseData,
      List<ExerciseSet>? sets,
      bool? isChecked,
    }
  ){
    return Exercise(
      exerciseData: exerciseData ?? this.exerciseData,
      sets: sets ?? this.sets,
      isChecked: isChecked ?? this.isChecked,
    );
  }
  @override
  List<Object> get props => [exerciseData];
}