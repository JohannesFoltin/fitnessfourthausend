import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:trainings_api/training_api.dart';
import 'package:trainings_repository/trainings_repository.dart';

import '../../trainingRepository.dart';

part 'training_editor_event.dart';
part 'training_editor_state.dart';

class TrainingEditorBloc
    extends Bloc<TrainingEditorEvent, TrainingEditorState> {
  TrainingEditorBloc(
    TrainingsRepository trainingsRepository,
    TrainingRepository trainingRepository,
  )   : _repository = trainingsRepository,
        _trainingRepository = trainingRepository,
        super(TrainingEditorState(training: Training())) {
    on<SubscribeToStream>(_onSubscribeToStream);
    on<AddExercise>(_addExercise);
    on<SubmitTraining>(_onSubmitTraining);
  }

  final TrainingsRepository _repository;
  final TrainingRepository _trainingRepository;

  Future<void> _onSubscribeToStream(
    SubscribeToStream event,
    Emitter<TrainingEditorState> emit,
  ) async {
    await emit.forEach(
      _trainingRepository.getTrainingStream(),
      onData: (training) => state.copyWith(training: training),
      onError: (error, stackTrace) => state,
    );
  }

  Future<void> _addExercise(
      AddExercise event, Emitter<TrainingEditorState> emit) async {
    _trainingRepository.safeTraining(
      _trainingRepository.getLastTraining().copyWith(
            exercises: List.of(_trainingRepository.getLastTraining().exercises)
              ..add(event.exercise),
          ),
    );
  }

  Future<void> _onSubmitTraining(
      SubmitTraining event, Emitter<TrainingEditorState> emit) async {
    await _repository.saveTraining(state.training);
  }
}
