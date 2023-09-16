import 'package:bloc_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:bloc_app/pages/profile/settings/widgets/setting_widget.dart';

import '../../../common/values/imports.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAPpbar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: <Widget>[
                  settingsButton(context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
