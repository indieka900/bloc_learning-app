import '../../common/values/imports.dart';

import 'bloc/sign_in_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Login'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buldthirdpartylogin(context),
                    Center(
                        child:
                            reusableText('Or use your email account to login')),
                    Container(
                      margin: EdgeInsets.only(top: 35.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Email'),
                          SizedBox(
                            height: 8.h,
                          ),
                          buildTextfiled(
                            'Enter your email address',
                            'email',
                            'user',
                            (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          reusableText('Password'),
                          SizedBox(
                            height: 8.h,
                          ),
                          buildTextfiled(
                            'Enter your password',
                            'password',
                            'lock',
                            (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    forgotpassword(),
                    SizedBox(height: 70.h),
                    buildLogInAndRegButton('Login', 'Login', () {
                      SignInController(context: context).handleSignIn('email');
                    }),
                    buildLogInAndRegButton('Register', 'Register', () {
                      Navigator.pushNamed(context, '/register');
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
