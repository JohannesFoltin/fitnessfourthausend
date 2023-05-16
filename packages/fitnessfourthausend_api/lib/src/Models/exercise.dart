import 'package:fitnessfourthausend_api/fitnessfourthausend_api.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Exercise {
  ExerciseData uebung;
  List<ExerciseSet> sets;
  bool isChecked;

  Exercise(this.uebung, this.sets,this.isChecked);
}