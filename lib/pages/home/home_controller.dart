//import 'package:bloc_app/common/values/imports.dart';

import 'package:bloc_app/common/apis/course_api.dart';
import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
//import 'package:bloc_app/common/values/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';

class HomeController {
  final BuildContext context;

  HomeController({required this.context});
  User userProfile = Global.storageService.getUserProfile();

  void init() async {
    var result = await CourseApi.courseList();
    // ignore: use_build_context_synchronously
    context.read<HomePageBloc>().add(HomePafeCourseItem(courseItem: result));
    print(result[0].name);
  }
}
