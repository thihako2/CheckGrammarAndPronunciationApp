import 'package:flutter/material.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';
import 'package:mmengstrain/Presentation/Widgets/OutputViewWidgets.dart';
import 'package:mmengstrain/Presentation/Widgets/TextToWatch.dart';
import 'package:mmengstrain/Presentation/Widgets/TitleWIdgets.dart';

class RecordAndCheckPage extends StatefulWidget {
  String texttorecord;
  RecordAndCheckPage({required this.texttorecord});

  @override
  State<RecordAndCheckPage> createState() => _RecordAndCheckPageState();
}

class _RecordAndCheckPageState extends State<RecordAndCheckPage> {
  @override
  Widget build(BuildContext context) {
    print("Text To Record" + widget.texttorecord);
    return Scaffold(
      backgroundColor: AppColors.base,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(
                  texttoshow: "Please record these sentences....",
                  color: AppColors.secondary),
              TextToWatch(
                  text: widget.texttorecord, color: AppColors.secondary),
              OutputView(text: "test")
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.third,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Image.asset('Assets/Icons/mic.png'),
      ),
    );
  }
}
