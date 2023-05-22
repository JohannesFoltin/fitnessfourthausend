import 'package:bloc/bloc.dart';
import 'package:fitnessfourthausend/trainingRepository.dart';
import 'package:fitnessfourthausend_api/training_api.dart';
import 'package:fitnessfourthausend_repository/trainings_repository.dart';
import 'package:meta/meta.dart';

part 'training_editor_state.dart';

class TrainingEditorCubit extends Cubit<TrainingEditorState> {
  TrainingEditorCubit(
      {required TrainingsRepository trainingsRepository,
      required Training training,
      required TrainingRepository trainingRepository})
      : _repository = trainingsRepository,
        _trainingRepository = trainingRepository,
        super(TrainingEditorState(training: training));

  final TrainingsRepository _repository;
  final TrainingRepository _trainingRepository;

  void _subscribeToStream(){
    _trainingRepository.getTraining().listen((event) {
      emit(TrainingEditorState(training: event));
    });
  }
  void onSubmit(){
    _repository.saveTraining(state.training);
  }

}
