import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile_response.dart';

import '../../../../../../../Domain/entities/response/user_profile/add_user/user_profile.dart';

class UserStates {}

class UserInitialStates extends UserStates {}

class UserLoadingStates extends UserStates {}

class UserSuccessStates extends UserStates {
  UserProfileResponse userProfileResponse;

  UserSuccessStates({required this.userProfileResponse});
}

class UserErrorStates extends UserStates {
  String message;

  UserErrorStates({required this.message});
}

class GetUserLoadingStates extends UserStates {}

class GetUserSuccessStates extends UserStates {
  List<UserProfile> getUserData;

  GetUserSuccessStates({required this.getUserData});
}

class GetUserErrorStates extends UserStates {
  String message;

  GetUserErrorStates({required this.message});
}
