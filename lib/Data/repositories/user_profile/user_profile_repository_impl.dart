import 'package:e_commerce/Data/data_sources/remote/user_remote_date_source.dart';
import 'package:e_commerce/Domain/entities/request/user_request/user_profile_request.dart';
import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile_response.dart';
import 'package:e_commerce/Domain/entities/response/user_profile/get_user/get_user_response.dart';
import 'package:e_commerce/Domain/repositories/user_profile/user_profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  UserRemoteDataSource remoteDataSource;

  UserProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserProfileResponse> addUser({
    required UserProfileRequest userProfileRequest,
  }) {
    return remoteDataSource.addUser(userProfileRequest: userProfileRequest);
  }

  @override
  Future<GetUserResponse> getUser() {
    return remoteDataSource.getUser();
  }
}
