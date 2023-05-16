import 'package:fitnessfourthausend_api/fitnessfourthausend_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  ExerciseData uebung;
  List<ExerciseSet> sets;
  bool isChecked;

  Exercise(this.uebung, this.sets,this.isChecked);

    factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}