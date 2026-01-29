import 'package:e_commerce/Data/data_sources/remote/user_remote_date_source.dart';
import 'package:e_commerce/Domain/entities/request/user_request/user_profile_request.dart';
import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile_response.dart';
import 'package:e_commerce/Domain/entities/response/user_profile/get_user/get_user_response.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mappers/user/add_user/user_profile_mapper.dart';
import 'package:e_commerce/api/mappers/user/add_user/user_profile_request_mapper.dart';
import 'package:e_commerce/api/mappers/user/get_user/get_user_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../core/cache/shared_prefs_utils.dart';

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  ApiServices apiServices;

  UserRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UserProfileResponse> addUser({
    required UserProfileRequest userProfileRequest,
  }) async {
    String? token = await SharedPrefsUtils.getData(key: 'token');
    var userResponse = await apiServices.addUser(
      userProfileRequest.toUser(),
      token ?? '',
    );
    return userResponse.toUser();
  }

  @override
  Future<GetUserResponse> getUser() async {
    String? token = await SharedPrefsUtils.getData(key: 'token');
    var userResponse = await apiServices.getUser(token ?? '');
    return userResponse.toUser();
  }
}
