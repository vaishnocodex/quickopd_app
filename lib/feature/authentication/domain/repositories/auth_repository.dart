abstract class AuthRepository {
  Future<void> loginWithPhoneNumber(String phoneNumber);
  Future<void> verifyOtp(String phoneNumber, String otp);
}
