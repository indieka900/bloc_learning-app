import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
  Color bgcolor = Colors.blue,
  Color txtColor = const Color.fromARGB(255, 252, 3, 3),
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: bgcolor,
    textColor: txtColor,
    fontSize: 16.sp,
    webShowClose: true,

  );
}
