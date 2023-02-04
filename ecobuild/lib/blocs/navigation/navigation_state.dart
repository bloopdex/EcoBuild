part of 'navigation_cubit.dart';

@immutable
abstract class NavigationState {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState({
    required this.navbarItem,
    required this.index,
  });
}

class NavigationInitial extends NavigationState {
  const NavigationInitial(
      {super.navbarItem = NavbarItem.home, super.index = 0});
}

class NavigationChanged extends NavigationState {
  const NavigationChanged({
    required NavbarItem navbarItem,
    required int index,
  }) : super(navbarItem: navbarItem, index: index);
}
