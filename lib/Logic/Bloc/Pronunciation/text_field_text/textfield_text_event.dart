part of 'textfield_text_bloc.dart';

abstract class TextfieldTextEvent extends Equatable {
  const TextfieldTextEvent();
}

class SetTextEvent extends TextfieldTextEvent {
  String gettext;
  SetTextEvent({required this.gettext});
  @override
  List<Object> get props => [this.gettext];
}
