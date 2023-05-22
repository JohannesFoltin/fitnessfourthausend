import 'package:json_annotation/json_annotation.dart';

part 'exerciseSet.g.dart';

@JsonSerializable()
class ExerciseSet {
  int value;
  int reps;
  ExerciseSet({this.value = 0, this.reps = 0});

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);

  ExerciseSet copyWith(
    {
      int? value,
      int? reps,
    }
  ){
    return ExerciseSet(
      value: value?? this.value, 
      reps: reps?? this.reps);
  }
}
