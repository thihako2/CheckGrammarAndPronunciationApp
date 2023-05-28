part of 'textfield_text_bloc.dart';

abstract class TextfieldTextState extends Equatable {
  const TextfieldTextState();
}

class TextfieldTextInitial extends TextfieldTextState {
  @override
  List<Object> get props => [];
}

class TextfieldGetTextState extends TextfieldTextState {
  String text;
  TextfieldGetTextState({required this.text});
  @override
  List<Object> get props => [this.text];
}
