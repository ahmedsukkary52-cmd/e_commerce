import 'package:e_commerce/Domain/entities/response/user_profile/get_user/get_user_response.dart';
import 'package:e_commerce/Domain/repositories/user_profile/user_profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUseCase {
  GetUserUseCase({required this.repository});

  UserProfileRepository repository;

  Future<GetUserResponse> invoke() {
    return repository.getUser();
  }
}
