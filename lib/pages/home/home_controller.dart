//import 'package:bloc_app/common/values/imports.dart';

import 'package:bloc_app/common/entities/entities.dart';
//import 'package:bloc_app/common/values/imports.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class HomeController {
  final BuildContext context;

  HomeController({required this.context});
  User userProfile = Global.storageService.getUserProfile();

  void init() {
    print("Home controller is initialized");
  }
}
