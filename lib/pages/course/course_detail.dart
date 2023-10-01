import 'package:flutter/material.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  void initState() {
    super.initState();
    ModalRoute.of(context)!.settings.arguments as Map;
    
  }

  @override
  void didChangeDependencies() {
    ModalRoute.of(context)!.settings.arguments as Map;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
