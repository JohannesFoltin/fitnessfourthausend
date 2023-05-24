part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class NavigateToHome extends NavigationEvent {}

class NavigateToTrainingEditor extends NavigationEvent {}