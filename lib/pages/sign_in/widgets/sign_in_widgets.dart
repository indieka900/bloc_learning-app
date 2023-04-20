import '../../../common/values/imports.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Text(
      'Login',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 19.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
  );
}

Widget buldthirdpartylogin(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons('google'),
          _reusableIcons('facebook'),
          _reusableIcons('apple'),
        ],
      ),
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.69),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextfiled(
  String hinttext,
  String textType,
  String iconName,
  void Function(String value)? func,
) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 25.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(
        color: AppColors.primaryFourElementText,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 16.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 265.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            onSubmitted: (value) => func!(value),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintText: hinttext,
              hintStyle: const TextStyle(
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
  );
}

Widget forgotpassword() {
  return Container(
    width: 260.w,
    height: 45.h,
    margin: EdgeInsets.only(left: 25.w, top: 15.h),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot Password',
        style: TextStyle(
          fontSize: 13.sp,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          color: AppColors.primaryText,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: buttonName == 'Login' ? 30.h : 18.h,
      ),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        border: buttonName == 'Register'
            ? Border.all(
                color: AppColors.primaryFourElementText,
              )
            : null,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
        color: buttonName == 'Login' ? AppColors.primaryElement : Colors.white,
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color:
                buttonName == 'Login' ? Colors.white : AppColors.primaryElement,
            fontWeight: FontWeight.normal,
            fontSize: 20.sp,
          ),
        ),
      ),
    ),
  );
}
