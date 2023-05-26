part of 'exercise_list_tile_bloc.dart';

final class ExerciseListTileState extends Equatable {
  const ExerciseListTileState({
     this.initialExercise,
    this.sets = const [],
    this.isChecked = false,
    this.isExpanded = false,
  });

  final Exercise? initialExercise;
  final List<ExerciseSet> sets;
  final bool isChecked;
  final bool isExpanded;


  @override
  List<Object?> get props => [initialExercise,sets,isChecked,isExpanded];

  ExerciseListTileState copyWith({
    Exercise? initialExercise,
    List<ExerciseSet>? sets,
    bool? isChecked,
    bool? isExpanded,
  }) {
    return ExerciseListTileState(
      initialExercise: initialExercise ?? this.initialExercise,
      sets: sets ?? this.sets,
      isChecked: isChecked ?? this.isChecked,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
