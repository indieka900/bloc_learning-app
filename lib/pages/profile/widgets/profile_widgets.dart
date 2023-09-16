import 'package:bloc_app/common/values/imports.dart';

import '../../../common/widgets/base_text_widget.dart';

AppBar buildappbar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusabletext('Profile'),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage('assets/icons/headpic.png'),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage('assets/icons/edit_3.png'),
    ),
  );
}

//setting section buttons
var imagesInfo = <String, String>{
  "settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",
};
Widget buidListView(BuildContext context) {
  return Column(
    children: <Widget>[
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: <Widget>[
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    'assets/icons/${imagesInfo.values.elementAt(index)}',
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
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
