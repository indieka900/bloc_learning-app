part of 'register_bloc.dart';

@immutable
class RegisterState {
  final String username, email, password, confirmPassword;
  const RegisterState({
    this.email = '',
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
  });
  RegisterState copyWith({String? username, email, password, confirmPassword}) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

class RegisterInitial extends RegisterState {
  const RegisterInitial() : super();
}
