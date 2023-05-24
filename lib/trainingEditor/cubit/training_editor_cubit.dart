import 'package:bloc/bloc.dart';
import 'package:fitnessfourthausend/trainingRepository.dart';

import 'package:meta/meta.dart';
import 'package:trainings_api/training_api.dart';
import 'package:trainings_repository/trainings_repository.dart';

part 'training_editor_state.dart';

class TrainingEditorCubit extends Cubit<TrainingEditorState> {
  TrainingEditorCubit(
       TrainingsRepository trainingsRepository,
       TrainingRepository trainingRepository,)
      : _repository = trainingsRepository,
        _trainingRepository = trainingRepository,
        super(TrainingEditorState(training: Training()));

  final TrainingsRepository _repository;
  final TrainingRepository _trainingRepository;

  void _subscribeToStream() {
    _trainingRepository.getTrainingStream().listen((event) {
    //Wird nur geändert, wenn sich die exercises Anzahl ändert (für den Builder)
    //-> damit es sich nicht jede sekunde mit der Uhr aktualisisert

      if (event.exercises.length != state.training.exercises.length) {
        emit(TrainingEditorState(training: event));
      }
    });
  }

  void onSubmit() {
    _repository.saveTraining(_trainingRepository.getLastTraining());
  }
}
