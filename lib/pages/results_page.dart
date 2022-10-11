import 'package:bmi_calculator/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResults,
      required this.resultText,
      required this.interpretation});

  final String bmiResults;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Text(
              "Your Results :",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
            flex: 5,
            child: customCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        fontSize: 25.0,
                        color: (resultText == 'normal')
                            ? Color(0xff24d876)
                            : Colors.red),
                  ),
                  Text(
                    bmiResults,
                    style: const TextStyle(fontSize: 100.0),
                  ),
                  Column(
                    children: [
                      Text(
                        'Normal BMI range:',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).indicatorColor),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).indicatorColor),
                      ),
                    ],
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              colour: Theme.of(context).primaryColor,
            ),
          ),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
