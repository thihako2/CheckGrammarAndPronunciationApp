import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mmengstrain/Logic/Constants/Navigation/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial(NavbarItem.grammar, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.grammar:
        emit(NavigationInitial(NavbarItem.grammar, 0));
        break;
      case NavbarItem.pronunciation:
        emit(NavigationPronunciation(NavbarItem.pronunciation, 1));
        break;
    }
  }
}
