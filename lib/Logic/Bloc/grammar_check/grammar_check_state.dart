part of 'grammar_check_bloc.dart';

abstract class GrammarCheckState extends Equatable {
  bool button;
  GrammarCheckState({required this.button});
}

class GrammarCheckInitial extends GrammarCheckState {
  GrammarCheckInitial({required super.button});
  @override
  List<Object> get props => [button];
}

class GrammarCheckLoadingState extends GrammarCheckState {
  GrammarCheckLoadingState({required super.button});
  @override
  List<Object> get props => [button];
}

class GrammarCheckedState extends GrammarCheckState {
  final GrammarModel gmodel;
  GrammarCheckedState({required this.gmodel, required super.button});
  @override
  List<Object> get props => [gmodel, button];
}
