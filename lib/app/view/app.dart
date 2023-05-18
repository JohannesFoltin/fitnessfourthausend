import 'package:fitnessfourthausend_repository/fitnessfourthausend_repository.dart';
import 'package:flutter/material.dart';
import 'package:fitnessfourthausend/counter/counter.dart';
import 'package:fitnessfourthausend/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_fitnessfourthausend_api/local_storage_fitnessfourthausend_api.dart';

class App extends StatelessWidget {
  const App({super.key});

  todosApi = LocalStorageFitnessfourthausendApi(
    plugin: await SharedPreferences.getInstance(),
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FitnessfourthausendRepository(Shared),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const CounterPage(),
      ),
    );
  }
}
