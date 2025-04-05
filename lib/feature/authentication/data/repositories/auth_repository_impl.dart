import 'package:quick_opd/feature/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:quick_opd/feature/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    await remoteDataSource.loginWithPhoneNumber(phoneNumber);
  }

  @override
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    await remoteDataSource.verifyOtp(phoneNumber, otp);
  }
}
