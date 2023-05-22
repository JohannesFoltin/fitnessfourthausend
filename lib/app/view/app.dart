// ignore_for_file: lines_longer_than_80_chars

import 'package:fitnessfourthausend/l10n/l10n.dart';
import 'package:fitnessfourthausend/trainingOverview//view/trainingOverviewView.dart';
import 'package:fitnessfourthausend_repository/trainings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({required this.fitnessfourthausendRepository, super.key});
  
  final TrainingsRepository fitnessfourthausendRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: fitnessfourthausendRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const TrainingOverviewPage(),
      ),
    );
  }
}
