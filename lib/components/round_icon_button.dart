import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final void Function()? onClicked;
  const RoundIconButton({required this.icon, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: const CircleBorder(),
        fillColor: const Color(0xff4c4f5e),
        constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
        elevation: 0.0,
        onPressed: onClicked,
        child: Icon(icon));
  }
}
