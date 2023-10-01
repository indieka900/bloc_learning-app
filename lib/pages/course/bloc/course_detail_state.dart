part of 'course_detail_bloc.dart';

@immutable
class CourseDetailState {
  const CourseDetailState({this.courseItem});

  final CourseResponseEntity? courseItem;

  CourseDetailState copyWith({CourseResponseEntity? courseItem}) {
    return CourseDetailState(courseItem: courseItem ?? this.courseItem);
  }
}

//final class CourseDetailInitial extends CourseDetailState {}
