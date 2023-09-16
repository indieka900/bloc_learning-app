import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/pages/application/bloc/application_bloc.dart';

AppBar buildAPpbar() {
  return AppBar(
    title: Container(
      child: Container(
        child: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}

void _removeUser(BuildContext context) {
  
  Global.storageService.remove(
    AppConst.STORAGE_USER_TOKEN_KEY,
  );
  context.read<ApplicationBloc>().add(const TriggerAppEvent(0));
  Navigator.of(context).pushNamedAndRemoveUntil(
    AppRoutes.SIGN_IN,
    (route) => false,
  );
}

Widget settingsButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Confirm Logout"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => _removeUser(context),
                child: const Text('Confirm'),
              ),
            ],
            content: const Text("Confirm logout"),
          );
        },
      );
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/icons/Logout.png'),
        ),
      ),
    ),
  );
}
