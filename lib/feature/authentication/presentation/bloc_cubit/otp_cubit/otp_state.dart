part of 'otp_cubit.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitial extends OtpState {}

final class OtpVerificationLoading extends OtpState {}

final class OtpVerificationSuccess extends OtpState {}

final class OtpVerificationFailed extends OtpState {
  final String message;
  const OtpVerificationFailed(this.message);
  @override
  List<Object> get props => [message];
}

class OTPTimerRunning extends OtpState {
  final String remainingTime;
  const OTPTimerRunning(this.remainingTime);

  @override
  List<Object> get props => [remainingTime];
}

final class CounterComplete extends OtpState {}

final class OtpResendLoading extends OtpState {}

final class OtpResendSuccess extends OtpState {}

final class OtpResendError extends OtpState {
  final String message;
  const OtpResendError(this.message);
  @override
  List<Object> get props => [message];
}
