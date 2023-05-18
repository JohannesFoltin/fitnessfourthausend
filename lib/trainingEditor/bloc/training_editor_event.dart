// ignore_for_file: eol_at_end_of_file

part of 'training_editor_bloc.dart';

@immutable
abstract class TrainingEditorEvent {}

final class AddTraining extends TrainingEditorEvent{}

final class TrainingEditorSubscriptionRequested extends TrainingEditorEvent{}