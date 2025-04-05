import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_opd/feature/authentication/data/data_sources/auth_remote_data_source.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final AuthRemoteDataSource authRemoteDataSource;
  Timer? _timer;
  int levelClock = 20; // 2-minute countdown

  OtpCubit(this.authRemoteDataSource) : super(OtpInitial());
  //===== API =====
  Future<void> verifyOtp(String phone, String otp) async {
    emit(OtpVerificationLoading());
    try {
      await authRemoteDataSource.verifyOtp(phone, otp);
      emit(OtpVerificationSuccess());
    } catch (e) {
      emit(OtpVerificationFailed(e.toString()));
    }
  }

  //==== Formate in 00:00 ===
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

//===== Clock Timer =====
  void startOtpTimer() {
    emit(OTPTimerRunning(formatTime(levelClock)));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (levelClock <= 0) {
        _timer?.cancel();
        emit(CounterComplete());
      } else {
        levelClock--;
        emit(OTPTimerRunning(formatTime(levelClock)));
      }
    });
  }

//======  Resend OTP =========

  Future<void> resendOtp(String phone) async {
    emit(OtpResendLoading());
    // try {
    //   await authRemoteDataSource.loginWithPhoneNumber(phone);
    //   levelClock = 20;
    //   startOtpTimer();
    //   emit(OtpResendSuccess());
    // } catch (e) {
    //   emit(OtpResendError(e.toString()));
    // }
  }

//======== Masking  the number =======
  String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 4) return phoneNumber;
    return phoneNumber.replaceRange(
        6, phoneNumber.length - 3, '*' * (phoneNumber.length - 6));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
