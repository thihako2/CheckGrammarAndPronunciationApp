import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmengstrain/Logic/Bloc/Pronunciation/text_field_text/textfield_text_bloc.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';
import 'package:mmengstrain/Presentation/Pronunciation/voice_checker.dart';
import 'package:mmengstrain/Presentation/Widgets/InputViewWidgets.dart';
import 'package:mmengstrain/Presentation/Widgets/ResponsiveNextButton.dart';

class PronunciationChecker extends StatefulWidget {
  const PronunciationChecker({super.key});

  @override
  State<PronunciationChecker> createState() => _PronunciationCheckerState();
}

class _PronunciationCheckerState extends State<PronunciationChecker> {
  TextEditingController controller = TextEditingController();
  String text = "";

  set string(String value) => setState(() => text = value);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  SetText(String val) {
    setState(() {
      text = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.base,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputView(
              controller: controller,
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<TextfieldTextBloc, TextfieldTextState>(
              builder: (context, state) {
                return ResponsiveNextButton(
                    NextWidget: VoiceCheck(
                      texttoRecord:
                          state is TextfieldGetTextState ? state.text : "",
                    ),
                    // NextWidget: RecordAndCheckPage(
                    //     texttorecord:
                    //         state is TextfieldGetTextState ? state.text : ""),
                    ShowText: "Check Pronunciation",
                    Width: 300);
              },
            )
          ],
        ),
      ),
    );
  }
}
