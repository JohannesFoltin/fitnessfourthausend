part of 'training_editor_cubit.dart';

@immutable
final class TrainingEditorState {

  const TrainingEditorState({
    required this.training,
    this.date,
  });

  final Training training;
  final DateTime? date;

  TrainingEditorState copyWith({
    Training? training,
    DateTime? date,
  }) {
    return TrainingEditorState(
      training: training ?? this.training,
      date: date ?? this.date,
    );
  }
}

