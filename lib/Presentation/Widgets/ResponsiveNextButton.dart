import 'package:flutter/material.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';

class ResponsiveNextButton extends StatefulWidget {
  Widget NextWidget;
  String ShowText;
  double Width;
  ResponsiveNextButton(
      {required this.NextWidget, required this.ShowText, required this.Width});

  @override
  State<ResponsiveNextButton> createState() => _ResponsiveNextButtonState();
}

class _ResponsiveNextButtonState extends State<ResponsiveNextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => widget.NextWidget));
      },
      child: Container(
        width: widget.Width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.secondary),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.ShowText,
                style: TextStyle(color: AppColors.primary),
              ),
              Image.asset('Assets/Icons/next.png')
            ],
          ),
        ),
      ),
    );
  }
}
