import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmengstrain/Logic/Bloc/Pronunciation/text_field_text/textfield_text_bloc.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';

typedef void StringCallback(String val);

class InputView extends StatefulWidget {
  TextEditingController controller;
  // String text;
  // final StringCallback onChange;
  // VoidCallback? action;
  InputView({required this.controller});

  @override
  State<InputView> createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.third),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          onChanged: (value) {
            context.read<TextfieldTextBloc>().add(SetTextEvent(gettext: value));
          },
          controller: widget.controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter the text...",
              hintStyle: TextStyle(color: AppColors.primary)),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ),
    );
  }
}
