import 'package:bloc_app/common/entities/course.dart';
import 'package:bloc_app/common/values/imports.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomepageDots>(_homeDots);
    on<HomePafeCourseItem>(_homePageCourseItem);
  }

  void _homeDots(HomepageDots event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _homePageCourseItem(
      HomePafeCourseItem event, Emitter<HomePageState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
