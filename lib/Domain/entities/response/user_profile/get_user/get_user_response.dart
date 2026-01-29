import '../add_user/user_profile.dart';

class GetUserResponse {
  final int? results;
  final String? status;
  final List<UserProfile>? data;

  GetUserResponse({this.results, this.status, this.data});
}
