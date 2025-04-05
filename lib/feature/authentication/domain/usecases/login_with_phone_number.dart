import 'package:quick_opd/feature/authentication/domain/repositories/auth_repository.dart';

class LoginWithPhoneNumber {
  final AuthRepository repository;

  LoginWithPhoneNumber(this.repository);

  Future<void> call(String phoneNumber) {
    return repository.loginWithPhoneNumber(phoneNumber);
  }
}
