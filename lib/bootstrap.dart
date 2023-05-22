import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/widgets.dart';
import 'package:trainings_api/training_api.dart';
import 'package:trainings_repository/trainings_repository.dart';

import 'app/app.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

void bootstrap({required TrainingsApi trainingsApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final trainingsRepository = TrainingsRepository(api: trainingsApi);

  runZonedGuarded(
    () => runApp(App(fitnessfourthausendRepository: trainingsRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
