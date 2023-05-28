import 'package:flutter/material.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';

class OutputView extends StatelessWidget {
  String text;
  OutputView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.third),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Output',
                style: TextStyle(
                    color: AppColors.base,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.base,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
