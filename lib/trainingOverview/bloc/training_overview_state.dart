// ignore_for_file: lines_longer_than_80_chars

part of 'training_overview_bloc.dart';

enum TrainingOverviewStatus { initial, loading, success, failure }

final class TrainingOverviewState {

  const TrainingOverviewState({this.trainings = const [],this.trainingEditorStatus = TrainingOverviewStatus.initial});

  final List<Training> trainings;
  final TrainingOverviewStatus trainingEditorStatus;

  TrainingOverviewState copyWith({
    List<Training>? trainings,
    TrainingOverviewStatus? trainingEditorStatus,
  }) {
    return TrainingOverviewState(
      trainings: trainings ?? this.trainings,
      trainingEditorStatus: trainingEditorStatus ?? this.trainingEditorStatus,
    );
  }

}
