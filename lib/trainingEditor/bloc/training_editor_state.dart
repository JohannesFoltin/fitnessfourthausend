// ignore_for_file: lines_longer_than_80_chars

part of 'training_editor_bloc.dart';

enum TrainingEditorStatus { initial, loading, success, failure }

final class TrainingEditorState {

  const TrainingEditorState({this.trainings = const [],this.trainingEditorStatus = TrainingEditorStatus.initial});

  final List<Training> trainings;
  final TrainingEditorStatus trainingEditorStatus;

  TrainingEditorState copyWith({
    List<Training>? trainings,
    TrainingEditorStatus? trainingEditorStatus,
  }) {
    return TrainingEditorState(
      trainings: trainings ?? this.trainings,
      trainingEditorStatus: trainingEditorStatus ?? this.trainingEditorStatus,
    );
  }

}
