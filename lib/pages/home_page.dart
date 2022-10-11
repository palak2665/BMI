import 'package:bmi_calculator/model/calculator.dart';
import 'package:bmi_calculator/model/theme_changer.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../model/state_data.dart';
import '../widgets/RoundButton.dart';
import '../widgets/bottom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/gender_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("BMI Calculator")),
          actions: [
            IconButton(
              icon:
                  Icon(themeService.darkTheme ? Icons.sunny : Icons.dark_mode),
              onPressed: () {
                themeService.darkTheme = !themeService.darkTheme;
              },
            ),
          ],
        ),
        body: Consumer<StateData>(
          builder: (context, StateData, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: customCard(
                        onPress: () {
                          StateData.updateMaleColor();
                        },
                        cardChild: const genderCard(
                          icon: FontAwesomeIcons.mars,
                          gender: 'MALE',
                        ),
                        colour: StateData.selectedGender == Gender.male
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).cardColor,
                      ),
                    ),
                    Expanded(
                        child: customCard(
                      onPress: () {
                        StateData.updateFemaleColor();
                      },
                      cardChild: const genderCard(
                        gender: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                      colour: StateData.selectedGender == Gender.female
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).cardColor,
                    )),
                  ],
                )),
                Expanded(
                  child: customCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(StateData.getValue().floor().toString(),
                                style: const TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w900)),
                            const Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: const Color(0xffeb1555),
                              activeTrackColor: const Color(0xffeb1555),
                              inactiveTrackColor:
                                  const Color.fromARGB(255, 255, 236, 236),
                              overlayColor: const Color(0x29eb1555),
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 30.0)),
                          child: Slider(
                            value: StateData.value,
                            min: 120.0,
                            max: 221.0,
                            onChanged: (double newValue) {
                              StateData.setValue(newValue);
                            },
                          ),
                        )
                      ],
                    ),
                    colour: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: customCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            StateData.getWeight.toString(),
                            style: const TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  StateData.decreaseWeight();
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  StateData.increaseWeight();
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: Theme.of(context).primaryColor,
                    )),
                    Expanded(
                        child: customCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            StateData.getAge.toString(),
                            style: const TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  StateData.decreaseAge();
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  StateData.increaseAge();
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: Theme.of(context).primaryColor,
                    )),
                  ],
                )),
                BottomButton(
                  buttonTitle: 'CALCULATE',
                  onTap: () {
                    Calculator calc = Calculator(
                        height: StateData.getValue().toInt(),
                        weight: StateData.getWeight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                  bmiResults: calc.calculateBMI(),
                                  resultText: calc.getResults(),
                                  interpretation: calc.getInterpretation(),
                                )));
                  },
                ),
              ],
            );
          },
        ));
  }
}
