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
        super(ExerciseListTileState(initialExercise: exercise)) {

  }

  final TrainingRepository _trainingRepository;
  final Exercise _exercise;
}
