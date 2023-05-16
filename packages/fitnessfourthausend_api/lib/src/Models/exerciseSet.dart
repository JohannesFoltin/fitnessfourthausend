import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class ExerciseSet {
  int value;
  int reps;
  ExerciseSet(this.value, this.reps);
}
