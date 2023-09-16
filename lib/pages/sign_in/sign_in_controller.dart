

// ignore_for_file: use_build_context_synchronously

import '../../common/values/imports.dart';
import 'bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        //BlocProvider.of<SignInBloc>(context).state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'You need to fill in email address');
          return;
        } else {
        }
        if (password.isEmpty) {
          toastInfo(msg: 'You need to fill in password');
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {}
          // if (!credential.user!.emailVerified) {
          //   toastInfo(msg: 'User not verrified');
          //   return;
          // }
          var user = credential.user;
          if (user != null) {
            Global.storageService.setString(
              AppConst.STORAGE_USER_TOKEN_KEY,
              'value123',
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/application',
              (route) => false,
            );
          } else {}
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user with such credentials found');
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password check the password and try again');
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Invalid email');
            return;
          }
        }
      }
    } catch (e) {
      // TOD
    }
  }
}
