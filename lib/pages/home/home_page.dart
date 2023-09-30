import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_app/pages/home/home_controller.dart';
import 'package:bloc_app/pages/home/widgets/homepage_widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late HomeController _homeController;

  @override
  void initState() {
    _homeController = HomeController(context: context);
    _homeController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildappBar(
        "${AppConst.SERVER_API_URL}${_homeController.userProfile.avatar}",
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
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
                    _homeController.userProfile.fullName!,
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
                          onTap: () {},
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
