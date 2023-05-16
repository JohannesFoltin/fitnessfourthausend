import 'package:fitnessfourthausend_api/fitnessfourthausend_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'training.g.dart';

@JsonSerializable()
class Training {
  final String id;
  final int duration;
  final DateTime date;
  final List<Exercise> exercises;

  Training({
    this.duration = 0,
    required this.date,
    this.exercises = const [],
    String? id,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  /// Returns a copy of this `Training` with the given values updated.
  ///
  /// {@macro todo_item}
  Training copyWith({
    String? id,
    int? duration,
    DateTime? date,
    List<Exercise>? exercises,
  }) {
    return Training(
      id: id ?? this.id,
      duration: duration ?? this.duration,
      date: date ?? this.date,
      exercises: exercises ?? this.exercises,
    );
  }

  factory Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingToJson(this);
}
