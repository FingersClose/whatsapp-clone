import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomButton extends StatelessWidget {
  late String text;
  TextStyle? textStyle;
  
  BottomButton({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
      children: [
        ElevatedButton(onPressed: (){}, child: Text(text, style: textStyle,))
      ],
    ),
    );
  }
}