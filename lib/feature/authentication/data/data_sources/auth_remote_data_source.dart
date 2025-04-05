import 'package:get_it/get_it.dart';
import 'package:quick_opd/core/api/api_helper.dart';
import 'package:quick_opd/core/api/api_url.dart';
import 'package:quick_opd/core/cache/secure_local_storage.dart';
import 'package:quick_opd/core/utils/logger.dart';
import 'package:quick_opd/core/utils/toast_utils.dart';

abstract class AuthRemoteDataSource {
  Future<void> loginWithPhoneNumber(String phoneNumber);
  Future<void> verifyOtp(String phoneNumber, String otp);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();
  final apiHelper = GetIt.instance<ApiHelper>();
  final storage = GetIt.instance<SecureLocalStorage>();
  @override
  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    try {
      final response = await apiHelper.execute(
        method: Method.post,
        url: ApiUrl.sendOtp,
        data: {"mobile_no": phoneNumber},
      );
      String message = response['data']["message"] ?? "";
      RegExp regex = RegExp(r'\d{4}');
      String? extractedOtp = regex.firstMatch(message)?.group(0);
      ToastUtils.defaultToast(message: "OTP: $extractedOtp");
    } catch (e) {
      throw Exception("Failed to send OTP: $e");
    }
  }

  @override
  Future<void> verifyOtp(String phone, String otp) async {
    try {
      final response = await apiHelper.execute(
        method: Method.post,
        url: ApiUrl.verifyOtp,
        data: {"mobile_no": phone, "otp": otp},
      );

      String token = response["token"];
      await storage.save(key: "auth_token", value: token);

      logger.d("OTP Verified, Token Saved!");
    } catch (e) {
      logger.d("OTP Verification Failed: $e");
    }
  }
}
