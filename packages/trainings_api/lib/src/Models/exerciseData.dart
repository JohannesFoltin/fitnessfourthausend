import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

part 'exerciseData.g.dart';

@immutable
@JsonSerializable()
class ExerciseData extends Equatable {

  final String id;
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
      this.type = "",
      String? id}) : assert(
        id == null || id.isNotEmpty,
  'id can not be null and should be empty',
  ),
        id = id ?? const Uuid().v4();

  factory ExerciseData.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseDataToJson(this);

  ExerciseData copyWith({
    String? ID,
    String? name,
    String? description,
    String? pictureAsset,
    String? notes,
    String? unit,
    String? type,
  }) {
    return ExerciseData(
      id: ID ?? this.id,
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
      [id];
}
