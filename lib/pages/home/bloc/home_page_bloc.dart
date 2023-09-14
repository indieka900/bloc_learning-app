import 'package:bloc_app/common/values/imports.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageInitial()) {
    on<HomepageDots>((event, emit) {
      emit(HomePageState(event.index));
    });
  }
}
