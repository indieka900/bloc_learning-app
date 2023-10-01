import 'package:bloc_app/common/entities/course.dart';
import 'package:bloc_app/common/values/imports.dart';

part 'course_detail_event.dart';
part 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    on<CourseDetailEvent>((event, emit) {
      emit(CourseDetailState(courseItem: state.courseItem));
    });
  }

}
