import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'textfield_text_event.dart';
part 'textfield_text_state.dart';

class TextfieldTextBloc extends Bloc<TextfieldTextEvent, TextfieldTextState> {
  TextfieldTextBloc() : super(TextfieldTextInitial()) {
    // on<TextfieldTextEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<SetTextEvent>((event, emit) {
      emit(TextfieldGetTextState(text: event.gettext));
    });
  }
}
