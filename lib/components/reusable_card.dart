import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final void Function()? onClicked;

  ReusableCard({Key? key, required this.colour, this.cardChild, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
