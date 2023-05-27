import 'package:flutter/material.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';
import 'package:mmengstrain/Presentation/Widgets/InputViewWidgets.dart';
import 'package:mmengstrain/Presentation/Widgets/OutputViewWidgets.dart';

class GrammarChecker extends StatefulWidget {
  const GrammarChecker({super.key});

  @override
  State<GrammarChecker> createState() => _GrammarCheckerState();
}

class _GrammarCheckerState extends State<GrammarChecker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.base,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InputView(),
              SizedBox(
                height: 40,
              ),
              OutputView()
            ],
          ),
        ),
      ),
    );
  }
}
