import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

@JsonSerializable()
class ExerciseData {
  String name;
  String description;
  String pictureAsset;
  String notes;
  String unit;
  String typ;
  int maximum;

  ExerciseData(this.name, this.description, this.pictureAsset, this.typ,
      this.notes, this.unit,this.maximum);
}