import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';

AppBar buildappBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/icons/person.png'),
              )),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(
  String text, {
  Color color = AppColors.primaryText,
  int top = 20,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 16.w,
              height: 16.w,
              margin: EdgeInsets.only(left: 17.w),
              child: Image.asset('assets/icons/search.png'),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                // onChanged: (value) => func!(value),
                // onSubmitted: (value) => func!(value),
                autocorrect: false,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(7, 5, 0, 5),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintText: "Search your course",
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.primaryText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
      // SizedBox(width: 10.w),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

//sliders view
Widget slidersView(BuildContext context, HomePageState state) {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomepageDots(value));
          },
          children: <Widget>[
            _sliderContainer(),
            _sliderContainer(path: 'Image(1)'),
            _sliderContainer(path: 'Image(2)'),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      )
    ],
  );
}

//sliders widget
Widget _sliderContainer({String path = 'Art'}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/icons/$path.png'),
      ),
    ),
  );
}

//menu view for showing items
Widget menuView() {
  return Column(
    children: <Widget>[
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _reusableText('Choose your course'),
            GestureDetector(
              child: _reusableText(
                'See all',
                color: AppColors.primaryThreeElementText,
                fontsize: 10,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: <Widget>[
            _reusableMenuText('All'),
            _reusableMenuText(
              'Popular',
              bgColor: Colors.white,
              txtColor: AppColors.primaryThreeElementText,
            ),
            _reusableMenuText(
              'Newest',
              bgColor: Colors.white,
              txtColor: AppColors.primaryThreeElementText,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableText(
  String text, {
  Color color = AppColors.primaryText,
  FontWeight fw = FontWeight.bold,
  int fontsize = 16,
}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fw,
        fontSize: fontsize.sp,
      ),
    ),
  );
}

//for the menu button
Widget _reusableMenuText(
  String label, {
  Color txtColor = AppColors.primaryElementText,
  Color bgColor = AppColors.primaryElement,
}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryElement),
      borderRadius: BorderRadius.circular(7.w),
      color: bgColor,
    ),
    child: _reusableText(
      label,
      color: txtColor,
      fw: FontWeight.normal,
      fontsize: 11,
    ),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/icons/Image(1).png'),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Best course of IT and engineering',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'Flutter best course',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryForthElement,
            fontWeight: FontWeight.normal,
            fontSize: 8.sp,
          ),
        ),
      ],
    ),
  );
}
