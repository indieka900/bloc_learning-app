import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/pages/application/bloc/application_bloc.dart';

import '../../../../common/widgets/base_text_widget.dart';

AppBar buildAPpbar() {
  return AppBar(
    title: Container(
      child: reusabletext('Settings')
    ),
  );
}

void _removeUser(BuildContext context) {
  
  Global.storageService.remove(
    AppConst.STORAGE_USER_TOKEN_KEY,
  );
  Global.storageService.remove(
    AppConst.STORAGE_USER_PROFILE_KEY,
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
