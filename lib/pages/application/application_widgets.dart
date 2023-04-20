import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

Widget buildPage(int page) {
  List<Widget> widgets = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Course')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Profile')),
  ];
  return widgets[page];
}

List<BottomNavigationBarItem> get navigationItems {
    return [
      BottomNavigationBarItem(
        label: 'Home',
        icon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset('assets/icons/home.png'),
        ),
        activeIcon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset(
            'assets/icons/home.png',
            color: AppColors.primaryElement,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Search',
        icon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset('assets/icons/search2.png'),
        ),
        activeIcon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset(
            'assets/icons/search2.png',
            color: AppColors.primaryElement,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Course',
        icon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset('assets/icons/play-circle1.png'),
        ),
        activeIcon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset(
            'assets/icons/play-circle1.png',
            color: AppColors.primaryElement,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Chat',
        icon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset('assets/icons/message-circle.png'),
        ),
        activeIcon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset(
            'assets/icons/message-circle.png',
            color: AppColors.primaryElement,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Profile',
        icon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset('assets/icons/person2.png'),
        ),
        activeIcon: SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset(
            'assets/icons/person2.png',
            color: AppColors.primaryElement,
          ),
        ),
      ),
    ];
  }
