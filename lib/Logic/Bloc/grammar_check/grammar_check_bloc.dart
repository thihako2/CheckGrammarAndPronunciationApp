import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mmengstrain/Logic/Repository/GrammarRepo/grammar_repository.dart';
import 'package:mmengstrain/Logic/models/GrammarModel.dart';

part 'grammar_check_event.dart';
part 'grammar_check_state.dart';

class GrammarCheckBloc extends Bloc<GrammarCheckEvent, GrammarCheckState> {
  GrammarCheckBloc() : super(GrammarCheckInitial(button: false)) {
    final GrammarRepository _gramrepo = GrammarRepository();
    // TODO: implement event handler
    on<CheckGrammarEvent>((event, emit) async {
      print("Bloc is here");
      try {
        emit(GrammarCheckLoadingState(button: true));
        final grammarwrong = await _gramrepo.fetchGrammarFalts(event.text);
        print(grammarwrong.corrections);
        emit(GrammarCheckedState(gmodel: grammarwrong, button: false));
      } catch (e) {
        print(e);
      }
    });
  }
}
