import 'package:flutter/material.dart';
import 'package:bmi_calculitore/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final void Function()? onClicked;
  const BottomButton({required this.buttonTitle, this.onClicked});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: KBottomContainerColor,
        height: KBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: KLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
