import 'package:flutter/material.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';
import 'package:mmengstrain/Presentation/Widgets/InputViewWidgets.dart';

class PronunciationChecker extends StatefulWidget {
  const PronunciationChecker({super.key});

  @override
  State<PronunciationChecker> createState() => _PronunciationCheckerState();
}

class _PronunciationCheckerState extends State<PronunciationChecker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputView(),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.secondary),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Check Pronunciation",
                        style: TextStyle(color: AppColors.base),
                      ),
                      Image.asset('Assets/Icons/next.png')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
