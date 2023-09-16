import 'package:bloc_app/common/values/imports.dart';
import 'package:bloc_app/pages/profile/widgets/profile_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildappbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              profileIconAndEditButton(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: buidListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
