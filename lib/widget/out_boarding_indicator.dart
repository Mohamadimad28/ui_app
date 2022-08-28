import 'package:flutter/material.dart';

class OutBoardingIndicator extends StatelessWidget {
  const OutBoardingIndicator(
      {Key? key, this.marginEnd = 0, required this.selected})
      : super(key: key);
  final double marginEnd;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: 17,
      height: 4,
      decoration: BoxDecoration(
        color: selected ? Color(0xFF6F3CBD) : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
