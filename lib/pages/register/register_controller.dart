import 'package:bloc_app/common/widgets/flutter_toast.dart';
import 'package:bloc_app/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  Future<void> handleRegistration() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.confirmPassword;

    if (username.isEmpty) {
      toastInfo(msg: 'Username cannot be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'password cannot be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: 'email cannot be empty');
      return;
    }
    if (password != rePassword) {
      toastInfo(msg: 'Password did not match');
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(msg: 'An email has been sent to $email please activate!');
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      toastInfo(msg: e.code.toString());
    }
  }
}
