//unify blocProvider, routes and pages

// ignore_for_file: non_constant_identifier_names

import 'package:bloc_app/pages/course/course_detail.dart';
import 'package:bloc_app/pages/home/home_page.dart';
import 'package:bloc_app/pages/profile/settings/settings_page.dart';

import '../values/imports.dart';

class AppPages {
  static List<PageEntity> Routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: WelcomePage(),
          bloc: AppBlocsProvider.allBlocProviders[0]
          //or
          ///!bloc: BlocProvider(create: (_) => WelcomeBloc()),
          ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: AppBlocsProvider.allBlocProviders[1],
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: AppBlocsProvider.allBlocProviders[2],
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const Applicationpage(),
        bloc: AppBlocsProvider.allBlocProviders[3],
      ),
      PageEntity(
        route: AppRoutes.HOMEPAGE,
        page: const Homepage(),
        bloc: AppBlocsProvider.allBlocProviders[4],
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingPage(),
        bloc: AppBlocsProvider.allBlocProviders[5],
      ),
      PageEntity(
        route: AppRoutes.COURSEDETAIL,
        page: const CourseDetail(),
        bloc: AppBlocsProvider.allBlocProviders[6],
      ),
    ];
  }

//returning all bloc providers
  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in Routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a model that cover the entire screen as we click on navigator object
  static MaterialPageRoute GeneratePageRouteSetting(RouteSettings settings) {
    if (settings.name != null) {
      //checking for route name matching when navigator gets triggered
      var result = Routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const Applicationpage(),
              settings: settings,
            );
          }
          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (context) => result.first.page,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute(
      builder: (context) => const SignIn(),
      settings: settings,
    );
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
