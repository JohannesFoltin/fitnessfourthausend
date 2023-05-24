import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

part 'exerciseData.g.dart';

@immutable
@JsonSerializable()
class ExerciseData extends Equatable {
  final String name;
  final String description;
  final String pictureAsset;
  final String notes;
  final String unit;
  final String type;

  ExerciseData(
      {this.name = "",
      this.description = "",
      this.pictureAsset = "",
      this.notes = "",
      this.unit = "",
      this.type = ""});

  factory ExerciseData.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseDataToJson(this);

  ExerciseData copyWith({
    String? name,
    String? description,
    String? pictureAsset,
    String? notes,
    String? unit,
    String? type,
  }) {
    return ExerciseData(
      name: name ?? this.name,
      description: description ?? this.description,
      pictureAsset: pictureAsset ?? this.pictureAsset,
      notes: notes ?? this.notes,
      unit: unit ?? this.unit,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props =>
      [name, description, pictureAsset, notes, unit, type];
}
