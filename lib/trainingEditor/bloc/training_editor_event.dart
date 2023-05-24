part of 'training_editor_bloc.dart';

sealed class TrainingEditorEvent extends Equatable {
  const TrainingEditorEvent();

  @override
  List<Object> get props => [];
}

final class SubscribeToStream extends TrainingEditorEvent {
  const SubscribeToStream();
}

final class AddExercise extends TrainingEditorEvent {
  const AddExercise({
     required this.exercise,});

  final Exercise exercise;

  @override
  List<Object> get props => [exercise];
}