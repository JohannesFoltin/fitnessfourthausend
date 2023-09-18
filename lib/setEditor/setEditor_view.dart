import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SetEditorView extends StatelessWidget {
  const SetEditorView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SetEditorView());
  }

  @override
  Widget build(BuildContext context) {
    int testValue = 0;
    int testValue2 = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {

        }, icon: const Icon(Icons.account_tree),),
      ),
      floatingActionButton:
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () {

          },child: Icon(Icons.add),),
          SizedBox(
            width: 16,
          ),
          FloatingActionButton(onPressed: () {

          },child: Icon(Icons.check),),
        ],
      ),
      body: Column(

        children: [
          SizedBox(
            height: 16,
          ),
          Text("Current Time"),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Gewicht"),
                  NumberPicker(minValue: 0, maxValue: 100, value: testValue, onChanged: (value) {
                    testValue = value;
                  },)
                ],
              ),
              Text("kg x"),
              Column(
                children: [
                  Text("Wiederholungen"),
                  NumberPicker(minValue: 0, maxValue: 100, value: testValue2, onChanged: (value) {
                    testValue2 = value;
                  },)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
