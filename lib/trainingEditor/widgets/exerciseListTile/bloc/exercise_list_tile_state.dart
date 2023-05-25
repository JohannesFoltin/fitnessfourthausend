part of 'exercise_list_tile_bloc.dart';

final class ExerciseListTileState extends Equatable {
  const ExerciseListTileState({
    required this.initialExercise,
    this.sets = const [],
    this.isChecked = false,
    this.isExpanded = false,
  });

  final Exercise initialExercise;
  final List<ExerciseSet> sets;
  final bool isChecked;
  final bool isExpanded;


  @override
  List<Object?> get props => [initialExercise,sets,isChecked];
}
