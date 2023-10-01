//import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/common/values/constants.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_app/pages/home/home_controller.dart';
import 'package:bloc_app/pages/home/widgets/homepage_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/user.dart';
import '../../common/routes/names.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late User userProfile;

  @override
  void initState() {
    // _homeController = HomeController(context: context);
    // _homeController.init();
    super.initState();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  void didChangeDependencies() {
    userProfile = HomeController(context: context).userProfile;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildappBar(
        "${AppConst.SERVER_API_URL}${userProfile.avatar}",
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state.courseItem.isEmpty) {
            HomeController(context: context).init();
          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    'Hello',
                    color: AppColors.primaryThreeElementText,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                    userProfile.fullName!,
                    top: 5,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(child: searchView()),
                SliverToBoxAdapter(child: slidersView(context, state)),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 0.w,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.courseItem.length,
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.COURSEDETAIL,
                              arguments: {
                                "id": state.courseItem.elementAt(index).id,
                              },
                            );
                          },
                          child: courseGrid(state.courseItem[index]),
                        );
                      },
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      crossAxisCount: 2,
                      childAspectRatio: 1.57,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
