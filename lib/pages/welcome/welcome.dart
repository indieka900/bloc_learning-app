import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/common/values/constants.dart';
import 'package:bloc_app/global.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              width: 375.w,
              margin: EdgeInsets.only(top: 55.h),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      state.page = value;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        'assets/images/reading.png',
                        'First See Learning',
                        'Forgot about a for of paper all knowledge in one learning!',
                        'next',
                      ),
                      _page(
                        2,
                        context,
                        'assets/images/boy.png',
                        'Connect With Everyone',
                        'Always keep in touch with your tutor & friend, let\'s get connected!',
                        'next',
                      ),
                      _page(
                        3,
                        context,
                        'assets/images/man.png',
                        'Always Fascinated Learning',
                        'Anywhere, anytime. The time is at your discretion so study whenever you want',
                        'Get Started',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 25.h,
                    child: DotsIndicator(
                      position: state.page.toDouble(),
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryText,
                        activeSize: const Size(20.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.2),
                        ),
                        size: const Size.square(8.0),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String imagepath,
    String title,
    String subtitle,
    String buttonname,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagepath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 26.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          margin: EdgeInsets.only(
            top: 13.h,
            right: 8.w,
            left: 16.w,
          ),
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCirc,
              );
            } else {
              Global.storageService.setBool(
                AppConst.STORAGE_DEVICE_OPEN_FIRST_TIME,
                true,
              );
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/sign_in',
                (route) => false,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 80.h, left: 25.w, right: 25.w),
            height: 50.h,
            width: 305.w,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.w),
            ),
            child: Center(
              child: Text(
                buttonname,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
