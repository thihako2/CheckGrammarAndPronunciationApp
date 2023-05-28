import 'package:flutter/material.dart';

class TextToWatch extends StatelessWidget {
  Color color;
  String text;
  TextToWatch({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: this.color),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(this.text),
          )),
    );
  }
}
