//import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppbar() {
  return AppBar(
    title: reusabletext("Course Detail"),
  );
}

Widget thumbNail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: AssetImage("assets/icons/image(3).png"),
      ),
    ),
  );
}

Widget menuView() {
  return SizedBox(
    width: 325.w,
    child: Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement),
              color: AppColors.primaryElement,
            ),
            child: reusabletext(
              'Auther Page',
              fw: FontWeight.normal,
              color: AppColors.primaryElementText,
              fontsize: 12.sp,
            ),
          ),
        ),
        _iconAndNum("assets/icons/people.png", 0),
        _iconAndNum("assets/icons/star.png", 10),
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: <Widget>[
        Image(
          image: AssetImage(iconPath),
          height: 20.h,
          width: 20.w,
        ),
        reusabletext(
          num.toString(),
          color: AppColors.primaryThreeElementText,
          fontsize: 12.sp,
          fw: FontWeight.normal,
        ),
      ],
    ),
  );
}

Widget discriptionText() {
  return reusabletext(
    "Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description",
    fw: FontWeight.normal,
    fontsize: 12.sp,
    color: AppColors.primaryThreeElementText,
  );
}

Widget goBuyButton(String name) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20.h),
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement),
    ),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.sp,
        color: AppColors.primaryElementText,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget courseSummary() {
  return reusabletext("The course Includes", fontsize: 18.sp);
}

var imagesInfo = <String, String>{
  "36 Hours Video": "video_detail.png",
  "Total 30 Lessons": "file_detail.png",
  "67 Download Resources": "download_detail.png",
};
Widget courseSummaryTitle(BuildContext context) {
  return Column(
    children: <Widget>[
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () {
            //Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
          },
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  //padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    'assets/icons/${imagesInfo.values.elementAt(index)}',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget courseLessonsList() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20.h),
    width: 325.w,
    height: 80.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 1),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 1),
        )
      ],
      borderRadius: BorderRadius.circular(10.w),
    ),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/icons/image(3).png"),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _listContainer(color: AppColors.primaryText),
                  _listContainer(
                    color: AppColors.primaryThreeElementText,
                    fontSize: 12,
                    fw: FontWeight.normal,
                  ),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Image(
              height: 24.h,
              width: 24.h,
              image: const AssetImage("assets/icons/arrow_right.png"),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _listContainer({
  double fontSize = 15.0,
  required Color color,
  FontWeight fw = FontWeight.bold,
}) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      "UI Design",
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fw,
        color: AppColors.primaryText,
      ),
    ),
  );
}
