part of 'exercise_list_tile_bloc.dart';

abstract class ExerciseListTileEvent extends Equatable {
  const ExerciseListTileEvent();
}
final class ChangeExerciseSet extends ExerciseListTileEvent{
  const ChangeExerciseSet({required this.exerciseSet});

  final ExerciseSet exerciseSet;

  @override
  List<Object?> get props => [exerciseSet];
}
final class AddExerciseSet extends ExerciseListTileEvent{
  const AddExerciseSet({required this.value, required this.reps});

  final int value;
  final int reps;

  @override
  List<Object?> get props => [value,reps];
}

final class DeleteExerciseSet extends ExerciseListTileEvent{
  const DeleteExerciseSet({required this.exerciseSet});

  final ExerciseSet? exerciseSet;

  @override
  List<Object?> get props => [exerciseSet];
}
final class Expand extends ExerciseListTileEvent{
  const Expand();

  @override
  List<Object?> get props => [];
}

final class Collapse extends ExerciseListTileEvent{
  const Collapse();

  @override
  List<Object?> get props => [];
}