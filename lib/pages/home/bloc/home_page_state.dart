part of 'home_page_bloc.dart';

@immutable
class HomePageState {
  final int index;

  final List<CourseResponseEntity> courseItem;

  const HomePageState({
    this.index = 0,
    this.courseItem = const <CourseResponseEntity>[],
  });

  HomePageState copyWith({int? index, List<CourseResponseEntity>? courseItem}) {
    return HomePageState(
      courseItem: courseItem ?? this.courseItem,
      index: index ?? this.index,
    );
  }
}



// class HomePageInitial extends HomePageState {
//   HomePageInitial() : super(index:0,courseItem:<CourseResponseEntity>[]);
// }
