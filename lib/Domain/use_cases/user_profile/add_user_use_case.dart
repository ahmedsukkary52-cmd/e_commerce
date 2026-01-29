import 'package:e_commerce/Domain/entities/request/user_request/user_profile_request.dart';
import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile_response.dart';
import 'package:e_commerce/Domain/repositories/user_profile/user_profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddUserUseCase {
  UserProfileRepository userProfileRepository;

  AddUserUseCase({required this.userProfileRepository});

  Future<UserProfileResponse> invoke({
    required UserProfileRequest userProfileRequest,
  }) {
    return userProfileRepository.addUser(
      userProfileRequest: userProfileRequest,
    );
  }
}
