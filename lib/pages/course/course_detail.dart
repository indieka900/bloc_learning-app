import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/common/widgets/base_text_widget.dart';
import 'package:bloc_app/pages/course/widgets/course_detail_widgets.dart';
//import 'package:flutter/material.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late var id;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as Map;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 25.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      thumbNail(),
                      SizedBox(height: 15.h),
                      menuView(),
                      SizedBox(height: 15.h),
                      reusabletext("Course Description"),
                      SizedBox(height: 15.h),
                      discriptionText(),
                      goBuyButton("Go Buy"),
                      courseSummary(),
                      courseSummaryTitle(context),
                      SizedBox(height: 20.h),
                      reusabletext("Lesson List"),
                      courseLessonsList(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
