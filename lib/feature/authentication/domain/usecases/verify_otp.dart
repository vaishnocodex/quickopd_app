import 'package:quick_opd/feature/authentication/domain/repositories/auth_repository.dart';

class VerifyOtp {
  final AuthRepository repository;

  VerifyOtp(this.repository);

  Future<void> call(String phoneNumber, String otp) {
    return repository.verifyOtp(phoneNumber, otp);
  }
}
