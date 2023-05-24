part of 'training_editor_bloc.dart';

class TrainingEditorState extends Equatable {
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

  @override
  List<Object?> get props => [training,date];
}
