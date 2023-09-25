// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bloc_app/common/apis/user_api.dart';
import 'package:bloc_app/common/entities/entities.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
        } else {}
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
            String? displayName = user.displayName;
            String? email = user.email;
            //String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();

            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.email = email;
            loginRequestEntity.fullName = displayName;
            //loginRequestEntity.id = id;
            loginRequestEntity.password = password;

            asyncPostAllData(loginRequestEntity);
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

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
    var result = await UserApi.login(loginRequestEntity: loginRequestEntity);
    if (result.status == true) {
      try {
        Global.storageService.setString(
          AppConst.STORAGE_USER_PROFILE_KEY,
          jsonEncode(result.user!),
        );
        Global.storageService.setString(
          AppConst.STORAGE_USER_TOKEN_KEY,
          result.token!,
        );
        EasyLoading.dismiss();
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/application',
          (route) => false,
        );
      } catch (e) {
        print('error while saving $e');
        EasyLoading.dismiss();
        toastInfo(msg: 'Unknown error occured');
      }
    }
  }
}
