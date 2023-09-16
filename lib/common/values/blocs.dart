import 'package:bloc_app/pages/application/bloc/application_bloc.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:bloc_app/pages/register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/sign_in/bloc/sign_in_bloc.dart';
import '../../pages/welcome/bloc/welcome_bloc.dart';

class AppBlocsProvider {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => ApplicationBloc()),
        BlocProvider(create: (context) => HomePageBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
      ];
}
