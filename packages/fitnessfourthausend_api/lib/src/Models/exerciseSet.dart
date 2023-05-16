import 'package:json_annotation/json_annotation.dart';

part 'exerciseSet.g.dart';

@JsonSerializable()
class ExerciseSet {
  int value;
  int reps;
  ExerciseSet(this.value, this.reps);

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);
}
