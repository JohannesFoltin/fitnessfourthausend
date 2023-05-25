import 'package:fitnessfourthausend/trainingEditor/widgets/clock/bloc/clock_bloc.dart';
import 'package:fitnessfourthausend/trainingEditor/widgets/ticker.dart';
import 'package:fitnessfourthausend/trainingRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ClockBloc(
            ticker: const TickerUp(),
            trainingRepository: context.read<TrainingRepository>(),
          )..add(const ClockStarted(duration: 0)),
      child: BlocBuilder<ClockBloc, ClockState>(
        builder: (context, state) {
          return TextButton(
            onPressed: () {
              if(state is ClockRunInProgress){
                context.read<ClockBloc>().add(const ClockPaused());
              }
              if(state is ClockRunPause){
                context.read<ClockBloc>().add(const ClockResumed());
              }
            },
            child: Text(state.time.toString()),
          );
        },
      ),
    );
  }
}
