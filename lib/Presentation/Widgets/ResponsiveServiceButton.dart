import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';

class ResponsiveServiceButton extends StatefulWidget {
  VoidCallback servicefunc;
  String ShowText;
  double Width;
  bool state;
  String image;
  ResponsiveServiceButton(
      {required this.servicefunc,
      required this.ShowText,
      required this.Width,
      required this.image,
      required this.state});

  @override
  State<ResponsiveServiceButton> createState() =>
      _ResponsiveServiceButtonState();
}

class _ResponsiveServiceButtonState extends State<ResponsiveServiceButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.servicefunc,
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
              Image.asset(widget.image)
            ],
          ),
        ),
      ),
    );
  }
}
