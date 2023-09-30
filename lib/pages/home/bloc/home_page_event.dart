part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {
  const HomePageEvent();
}

class HomepageDots extends HomePageEvent {
  final int index;
  const HomepageDots(this.index) : super();
}

class HomePafeCourseItem extends HomePageEvent {
  final List<CourseResponseEntity> courseItem;

  const HomePafeCourseItem({required this.courseItem}) : super();
}
