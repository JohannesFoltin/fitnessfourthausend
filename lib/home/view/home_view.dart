import 'package:fitnessfourthausend/app/navigationBloc/navigation_bloc.dart';
import 'package:fitnessfourthausend/trainingEditor/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello World!"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () =>
                Navigator.of(context).push(TrainingEditorPage.route()),
            child: const Text("Start Training"),
          ),
        ));
  }
}
