import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmengstrain/Logic/Bloc/grammar_check/grammar_check_bloc.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';
import 'package:mmengstrain/Logic/models/GrammarModel.dart';
import 'package:mmengstrain/Presentation/Widgets/ErrorShowWidgets.dart';
import 'package:mmengstrain/Presentation/Widgets/OutputViewWidgets.dart';
import 'package:mmengstrain/Presentation/Widgets/ResponsiveServiceButton.dart';

class GrammarChecker extends StatefulWidget {
  const GrammarChecker({super.key});

  @override
  State<GrammarChecker> createState() => _GrammarCheckerState();
}

class _GrammarCheckerState extends State<GrammarChecker> {
  final controller = TextEditingController();

  @override
  void initState() {
    print('inside init state');
    super.initState();
    var myBloc = BlocProvider.of<GrammarCheckBloc>(context);
    myBloc.stream.listen((state) {
      if (state is GrammarCheckInitial) {
        print('initial to bloc');
      }
      if (state is GrammarCheckLoadingState) {
        print('loading to bloc');
      }
      if (state is GrammarCheckedState) {
        print('checked to bloc');
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("widget is rebuilding");
    showsnackbar() {
      print("is null");
      final snackBar = SnackBar(
        content: const Text('Please Type Some English Sentences!'),
        backgroundColor: AppColors.third,
        action: SnackBarAction(
          label: 'dismiss',
          textColor: AppColors.primary,
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    click(value) {
      // try {
      context.read<GrammarCheckBloc>().add(CheckGrammarEvent(text: value));
      // } on RangeError {
      // }
    }

    return Container(
      color: AppColors.base,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<GrammarCheckBloc, GrammarCheckState>(
            builder: (context, state) {
              return Column(
                children: [
                  // InputView(
                  //   controller: controller,
                  // ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.third),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            onChanged: (value) {
                              controller.value.text.isEmpty
                                  ? showsnackbar()
                                  : click(value);
                            },
                            controller: controller,
                            style: TextStyle(color: AppColors.base),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: AppColors.primary,
                                hintText: "Enter the text...",
                                hintStyle: TextStyle(color: AppColors.primary)),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: ResponsiveServiceButton(
                            servicefunc: () {
                              controller.clear();
                              click("clear");
                            },
                            state: state is GrammarCheckLoadingState
                                ? false
                                : true,
                            ShowText: "Clear Text",
                            image: 'Assets/Icons/close.png',
                            Width: 250),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  SizedBox(
                    height: 20,
                  ),
                  state.button
                      ? CircularProgressIndicator()
                      : state is GrammarCheckedState
                          ? _buildOutputview(
                              context, state.gmodel, controller.value.text)
                          : Container()
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOutputview(
      BuildContext context, GrammarModel model, String originaltext) {
    var _result;
    List _correctedsuggestions = [];
    var _correction = model.corrections;
    String changeChar(String originalText, int fromPosition, int toPosition,
        String changeWith) {
      return originalText.replaceRange(
          fromPosition, toPosition + 1, changeWith);
    }

    if (_correction != null) {
      for (var suggestion in _correction.reversed) {
        print("in for");
        try {
          int? start = suggestion.from;
          int? end = suggestion.to;

          if (suggestion.suggestions!.isNotEmpty) {
            var suggest = suggestion.suggestions?.first;
            // for (var s in suggest!.text) {}
            String? text = suggest!.text;
            _result = changeChar(originaltext, start!, end!, text!);
            _correctedsuggestions.add(text);
          }
        } catch (e) {
          print(e);
        }
      }
    } else {
      _result = "test";
    }
    print(_result);

    print(_correctedsuggestions);

    return _result == "test" || _result == null
        ? Container(
            child: Center(
              child: Text("There is nothing to fix"),
            ),
          )
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Errors",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _correctedsuggestions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: ErrorShower(
                              text: _correctedsuggestions[index],
                              color: Colors.red),
                        );
                      }),
                ),
                OutputView(text: _result)
              ],
            ),
          );
  }
}
