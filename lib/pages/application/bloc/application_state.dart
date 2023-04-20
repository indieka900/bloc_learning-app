part of 'application_bloc.dart';

@immutable
class ApplicationState {
  final int index;
  const ApplicationState({required this.index});
}

class ApplicationInitial extends ApplicationState {
  const ApplicationInitial() : super(index: 0);
}


