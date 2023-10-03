import '../values/imports.dart';

Widget reusabletext(
  String text, {
  Color color = AppColors.primaryText,
  FontWeight fw = FontWeight.bold,
  double fontsize = 16,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fw,
      fontSize: fontsize.sp,
    ),
  );
}
