import 'package:bmi_calculitore/constants.dart';
import 'package:bmi_calculitore/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import 'package:bmi_calculitore/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String resultText;
  final String interpretation;

  const ResultPage(
      {required this.result,
      required this.resultText,
      required this.interpretation,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: KTitleTextStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: KActiveColorCard,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: KResultTextStyle,
                    ),
                    Text(
                      result,
                      style: KBMITextStyle,
                    ),
                    Text(
                      interpretation.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: KBodyTextStyle,
                    )
                  ],
                ),
              )),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onClicked: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
