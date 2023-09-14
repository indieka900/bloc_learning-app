part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {
  const HomePageEvent();
}

class HomepageDots extends HomePageEvent {
  final int index;
  const HomepageDots(this.index) : super();
}
