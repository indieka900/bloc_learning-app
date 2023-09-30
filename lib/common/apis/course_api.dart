import 'package:bloc_app/common/utils/http_util.dart';

import '../entities/course.dart';

// class CourseApi {
//   static Future<CourseResponseEntity> courseList() async {
//     var response = await HttpUtil().get('/api/courses/');
//     print(response.runtimeType); //List<dynami>

//     return CourseResponseEntity.fromJson(response);
//   }
// }

class CourseApi {
  static Future<List<CourseResponseEntity>> courseList() async {
    var response = await HttpUtil().get('/api/courses/');
    //print(response.runtimeType); // List<dynamic>

    if (response is List<dynamic>) {
      List<CourseResponseEntity> courseList = response.map((courseData) {
        return CourseResponseEntity.fromJson(courseData);
      }).toList();

      print("Number of courses: ${courseList.length}"); // Print the length

      return courseList;
    } else {
      throw Exception("Unexpected response format: ${response.runtimeType}");
    }
  }
}


