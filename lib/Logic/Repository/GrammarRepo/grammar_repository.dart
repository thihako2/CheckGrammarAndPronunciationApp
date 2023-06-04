import 'package:mmengstrain/Logic/Repository/GrammarRepo/grammar-provider.dart';
import 'package:mmengstrain/Logic/models/GrammarModel.dart';

class GrammarRepository {
  final _provider = GrammarProvider();

  Future<GrammarModel> fetchGrammarFalts(String text) {
    return _provider.fetchGrammarCheck(text);
  }
}
