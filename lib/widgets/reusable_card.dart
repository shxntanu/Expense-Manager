import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: cardChild
          ),
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 35.0, right: 35.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}