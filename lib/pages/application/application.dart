
import '../../common/values/imports.dart';
import 'application_widgets.dart';
import 'bloc/application_bloc.dart';

class Applicationpage extends StatelessWidget {
  const Applicationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primarySecondaryBackground,
          child: SafeArea(
            child: Scaffold(
              // appBar: AppBar(),
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value) {
                    context.read<ApplicationBloc>().add(TriggerAppEvent(value));
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  items: navigationItems,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
