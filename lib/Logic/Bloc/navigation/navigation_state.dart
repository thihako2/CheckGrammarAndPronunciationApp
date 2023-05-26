part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
  NavigationInitial(super.navbarItem, super.index);
}

class NavigationPronunciation extends NavigationState {
  NavigationPronunciation(super.navbarItem, super.index);
}
