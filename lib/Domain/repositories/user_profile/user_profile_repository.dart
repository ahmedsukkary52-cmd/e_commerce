import 'package:e_commerce/Domain/entities/request/user_request/user_profile_request.dart';
import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile_response.dart';
import 'package:e_commerce/Domain/entities/response/user_profile/get_user/get_user_response.dart';

abstract class UserProfileRepository {
  Future<UserProfileResponse> addUser({
    required UserProfileRequest userProfileRequest,
  });

  Future<GetUserResponse> getUser();
}
