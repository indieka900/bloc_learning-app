

import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/common/utils/http_util.dart';

class UserApi {
  static login({LoginRequestEntity? loginRequestEntity}) async {
    var response = await HttpUtil().post(
      '/api/users/',
      data: loginRequestEntity?.toJson(),
    );

    return UserLoginResponseEntity.fromJson(response);
  }
}
