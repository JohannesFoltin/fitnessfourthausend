part of 'training_editor_bloc.dart';

class TrainingEditorState extends Equatable {
  const TrainingEditorState({
    required this.training,
  });

  final Training training;

  TrainingEditorState copyWith({
    Training? training,
  }) {
    return TrainingEditorState(
      training: training ?? this.training,
    );
  }

  @override
  List<Object?> get props => [training];
}
