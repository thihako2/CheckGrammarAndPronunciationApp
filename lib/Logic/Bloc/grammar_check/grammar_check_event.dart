part of 'grammar_check_bloc.dart';

abstract class GrammarCheckEvent extends Equatable {
  String text;
  GrammarCheckEvent({required this.text});
}

class CheckGrammarEvent extends GrammarCheckEvent {
  CheckGrammarEvent({required super.text});
  @override
  List<Object> get props => [text];
}
