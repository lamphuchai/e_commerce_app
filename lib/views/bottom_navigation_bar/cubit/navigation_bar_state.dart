part of 'navigation_bar_cubit.dart';

class NavigationBarState extends Equatable {
  const NavigationBarState(this.indexPage);
  final int indexPage;
  @override
  List<Object> get props => [indexPage];
}

