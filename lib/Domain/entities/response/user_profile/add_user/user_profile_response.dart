import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile.dart';

class UserProfileResponse {
  final String? status;
  final String? message;
  final List<UserProfile>? data;

  UserProfileResponse({this.status, this.message, this.data});
}
