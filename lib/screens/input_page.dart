import 'package:bmi_calculitore/caluclator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'result_page.dart';
import 'package:bmi_calculitore/components/round_icon_button.dart';
import 'package:bmi_calculitore/components/bottom_button.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 100;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? KActiveColorCard
                          : KInactiveColorCard,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.person,
                        label: 'MALE',
                      ),
                      onClicked: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? KActiveColorCard
                          : KInactiveColorCard,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.personDress, label: 'FEMALE'),
                      onClicked: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: KActiveColorCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: KLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xff8d8e98),
                        thumbColor: KBottomContainerColor,
                        overlayColor: const Color(0x29eb1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 60.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: KActiveColorCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onClicked: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onClicked: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: KActiveColorCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onClicked: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onClicked: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            BottomButton(
                buttonTitle: 'CALCULATE',
                onClicked: () {
                  CalculatorBrain calculate =
                      CalculatorBrain(height: height, weight: weight);

                  print(calculate.calculateBMI());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                result: calculate.calculateBMI(),
                                resultText: calculate.getResult(),
                                interpretation: calculate.getInterpretation(),
                              )));
                }),
          ],
        ));
  }
}

enum Gender { male, female }
