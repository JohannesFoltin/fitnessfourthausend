import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessfourthausend/trainingRepository.dart';
import 'package:trainings_api/training_api.dart';

part 'exercise_list_tile_event.dart';

part 'exercise_list_tile_state.dart';

class ExerciseListTileBloc
    extends Bloc<ExerciseListTileEvent, ExerciseListTileState> {
  ExerciseListTileBloc(
      {required TrainingRepository trainingRepository,
      required Exercise exercise})
      : _trainingRepository = trainingRepository,
        _exercise = exercise,
        super(ExerciseListTileState(
            initialExercise: exercise, sets: exercise?.sets ?? [],),) {
    on<ChangeExerciseSet>(_onChangeExerciseSet);
    on<AddExerciseSet>(_onAddExerciseSet);
    on<DeleteExerciseSet>(_onDeleteExerciseSet);
    on<Expand>(_onExpand);
    on<Collapse>(_onCollapse);
  }

  final TrainingRepository _trainingRepository;
  final Exercise _exercise;

  Future<void> _onChangeExerciseSet(
      ChangeExerciseSet event, Emitter<ExerciseListTileState> emit) async {}

  Future<void> _onAddExerciseSet(
      AddExerciseSet event, Emitter<ExerciseListTileState> emit) async {
    final tmpExerciseSet = ExerciseSet(value: event.value, reps: event.reps);
    emit(state.copyWith(sets: List.of(state.sets)..add(tmpExerciseSet)));
    _trainingRepository.safeExercise(_exercise.copyWith(sets: state.sets));
  }

  Future<void> _onDeleteExerciseSet(
      DeleteExerciseSet event, Emitter<ExerciseListTileState> emit) async {
    if(event.exerciseSet == null){
      return;
    }
    final sets = [...state.sets];
    final setIndex = sets.indexWhere((element) => element == event.exerciseSet);
    if (setIndex >= 0) {
      sets.removeAt(setIndex);
      emit(state.copyWith(sets: sets));
      _trainingRepository.safeExercise(_exercise.copyWith(sets: state.sets));
    }
  }

  Future<void> _onExpand(
      Expand event, Emitter<ExerciseListTileState> emit) async {
    emit(state.copyWith(isExpanded: true));
  }

  Future<void> _onCollapse(
      Collapse event, Emitter<ExerciseListTileState> emit) async {
    emit(state.copyWith(isExpanded: false));
  }
}
