// ignore_for_file: eol_at_end_of_file

part of 'training_overview_bloc.dart';

@immutable
abstract class TrainingOverviewEvent {}

final class AddTraining extends TrainingOverviewEvent{}

final class TrainingOverviewSubscriptionRequested extends TrainingOverviewEvent{}