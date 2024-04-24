part of 'home_cubit.dart';

enum HomeTab { wallet, activities, account, other }

class HomeState extends Equatable {
  const HomeState({this.tab = HomeTab.wallet});
  final HomeTab tab;

  @override
  // TODO: implement props
  List<Object?> get props => [tab];
}
