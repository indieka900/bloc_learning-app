import 'common/routes/routes.dart';
import 'common/values/imports.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          onGenerateRoute: AppPages.GeneratePageRouteSetting,
        ),
      ),
    );
  }
}
