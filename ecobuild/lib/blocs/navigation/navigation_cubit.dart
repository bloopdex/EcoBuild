import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';
enum NavbarItem { home, measurements, orders }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial());

  void setNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationChanged(navbarItem: NavbarItem.home, index: 0));
        break;
      case NavbarItem.measurements:
        emit(const NavigationChanged(
            navbarItem: NavbarItem.measurements, index: 1));
        break;
      case NavbarItem.orders:
        emit(const NavigationChanged(navbarItem: NavbarItem.orders, index: 2));
        break;
    }
  }
}
