import 'dart:async';

import 'package:fitnessfourthausend/trainingEditor/widgets/ticker.dart';
import 'package:fitnessfourthausend/trainingEditor/widgets/timer/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  //ToDo Benachrichtigung wenn fertig!

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: const TickerDown(), duration: 90),
      child: const Column(
        children: [
          SizedBox(
            height: 8,
          ),
          TimerText(),
          SizedBox(
            height: 8,
          ),
          Actions(),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: TextStyle(fontSize: 18),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () => context
                      .read<TimerBloc>()
                      .add(TimerStarted(duration: state.duration)),
                  child: Icon(Icons.play_arrow),
                ),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              Expanded(
                child: ElevatedButton(
                  child: Icon(Icons.pause),
                  onPressed: () =>
                      context.read<TimerBloc>().add(TimerPaused()),
                ),
              ),
            ],
            if (state is TimerRunPause) ...[
              Expanded(
                child: ElevatedButton(
                  child: Icon(Icons.replay),
                  onPressed: () =>
                      context.read<TimerBloc>().add(TimerReset()),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: () =>
                      context.read<TimerBloc>().add(TimerResumed()),
                ),
              ),
            ],
            if (state is TimerRunComplete) ...[
              Expanded(
                child: ElevatedButton(
                  child: Icon(Icons.replay),
                  onPressed: () =>
                      context.read<TimerBloc>().add(TimerReset()),
                ),
              ),
            ]
          ],
        );
      },
    );
  }
}
