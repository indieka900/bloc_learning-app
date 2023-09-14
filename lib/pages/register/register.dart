import '../../common/values/imports.dart';
import 'bloc/register_bloc.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Register'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 17.h,
                    ),
                    Center(
                      child: reusableText(
                        'Enter your details below and free signUp',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Username'),
                          buildTextfiled(
                            'Enter your username',
                            'username',
                            'user',
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UsernameEvent(value));
                            },
                          ),
                          reusableText('Email'),
                          buildTextfiled(
                            'Enter your email address',
                            'email',
                            'user',
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
                            },
                          ),
                          reusableText('Password'),
                          buildTextfiled(
                            'Enter your password',
                            'password',
                            'lock',
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reusableText('Confirm Password'),
                          buildTextfiled(
                            'confirm your password',
                            'password',
                            'lock',
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(ConfirmPasswordEvent(value));
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.w),
                            child: reusableText(
                              'By creating an account you have to agree with our terms and conditions.',
                            ),
                          )
                        ],
                      ),
                    ),
                    buildLogInAndRegButton('Register', 'Login', () {
                      RegisterController(context).handleRegistration();
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
