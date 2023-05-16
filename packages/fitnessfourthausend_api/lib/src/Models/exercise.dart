import 'package:fitnessfourthausend_api/fitnessfourthausend_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  ExerciseData exerciseData;
  List<ExerciseSet> sets;
  bool isChecked;

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
}