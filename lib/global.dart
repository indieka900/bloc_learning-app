import 'package:bloc_app/common/routes/bloc_observer.dart';

import 'common/values/imports.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
