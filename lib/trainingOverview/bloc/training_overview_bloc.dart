// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trainings_api/training_api.dart';
import 'package:trainings_repository/trainings_repository.dart';

part 'training_overview_event.dart';
part 'training_overview_state.dart';

class TrainingOverviewBloc extends Bloc<TrainingOverviewEvent, TrainingOverviewState> {
  TrainingOverviewBloc(TrainingsRepository fitnessRepository) :
    _fitnessfourthausendRepository = fitnessRepository,
   super(const TrainingOverviewState()) {
   on<AddTraining>(_onAddTraining);
   on<TrainingOverviewSubscriptionRequested>(_onSubscriptionRequested);
  }

  final TrainingsRepository _fitnessfourthausendRepository;


  Future<void> _onSubscriptionRequested(
    TrainingOverviewSubscriptionRequested event,
    Emitter<TrainingOverviewState> emit,
  ) async {
    await emit.forEach<List<Training>>(
      _fitnessfourthausendRepository.getTraings(),
      onData: (todos) => state.copyWith(
        trainingEditorStatus: TrainingOverviewStatus.success,
        trainings: todos
      ),
      onError: (_, __) => state.copyWith(
        trainingEditorStatus: TrainingOverviewStatus.failure,
      ),
    );
  }

  void _onAddTraining(TrainingOverviewEvent event,Emitter<TrainingOverviewState> emit){
      final tmpTraining = Training(date: DateTime.now());
      _fitnessfourthausendRepository.saveTraining(tmpTraining);
  }
}
