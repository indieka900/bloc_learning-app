import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationInitial()) {
    on<TriggerAppEvent>((event, emit) {
      emit(ApplicationState(index: event.index));
    });
  }
}
