part of 'home_page_bloc.dart';

@immutable
class HomePageState {
  final int index;

  const HomePageState(this.index);

}

class HomePageInitial extends HomePageState {
  const HomePageInitial() : super(0);
}

