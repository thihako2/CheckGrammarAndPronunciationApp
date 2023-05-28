import 'package:flutter/material.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';

class TitleWidget extends StatelessWidget {
  String texttoshow;
  Color color;
  TitleWidget({required this.texttoshow, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      texttoshow,
      style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
