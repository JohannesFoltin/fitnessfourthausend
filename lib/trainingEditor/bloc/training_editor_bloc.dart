// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fitnessfourthausend_api/fitnessfourthausend_api.dart';
import 'package:fitnessfourthausend_repository/fitnessfourthausend_repository.dart';

part 'training_editor_event.dart';
part 'training_editor_state.dart';

class TrainingEditorBloc extends Bloc<TrainingEditorEvent, TrainingEditorState> {
  TrainingEditorBloc(FitnessfourthausendRepository fitnessRepository) :
    _fitnessfourthausendRepository = fitnessRepository,
   super(const TrainingEditorState()) {
   on<AddTraining>(_onAddTraining);
   on<TrainingEditorSubscriptionRequested>(_onSubscriptionRequested);
  }

  final FitnessfourthausendRepository _fitnessfourthausendRepository;


  Future<void> _onSubscriptionRequested(
    TrainingEditorSubscriptionRequested event,
    Emitter<TrainingEditorState> emit,
  ) async {
    await emit.forEach<List<Training>>(
      _fitnessfourthausendRepository.getTraings(),
      onData: (todos) => state.copyWith(
        trainingEditorStatus: TrainingEditorStatus.success,
        trainings: todos
      ),
      onError: (_, __) => state.copyWith(
        trainingEditorStatus: TrainingEditorStatus.failure,
      ),
    );
  }

  void _onAddTraining(TrainingEditorEvent event,Emitter<TrainingEditorState> emit){
      final tmpTraining = Training(date: DateTime.now());
      state.trainings.add(tmpTraining);
      _fitnessfourthausendRepository.saveTraining(tmpTraining);
  }
}
