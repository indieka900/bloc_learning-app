import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_app/pages/home/widgets/homepage_widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildappBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    'hello',
                    color: AppColors.primaryThreeElementText,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText('Joseph', top: 5),
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
                      childCount: 4,
                      (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: courseGrid(),
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
