//import 'package:bloc_app/common/values/imports.dart';

import 'package:bloc_app/common/apis/course_api.dart';
import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
//import 'package:bloc_app/common/values/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';

class HomeController {
  late BuildContext context;

  static final HomeController _singleTone = HomeController._internal();
  HomeController._internal();
  User get userProfile => Global.storageService.getUserProfile();
  factory HomeController({required BuildContext context}) {
    _singleTone.context = context;
    return _singleTone;
  }

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseApi.courseList();
      if (context.mounted) {
        context.read<HomePageBloc>().add(
              HomePafeCourseItem(courseItem: result),
            );
      }
      //print(result[0].name);
    }
  }
}
