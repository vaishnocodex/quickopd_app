import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_opd/core/utils/logger.dart';
import 'package:quick_opd/feature/authentication/data/data_sources/auth_remote_data_source.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRemoteDataSource authRemoteDataSource;
  LoginCubit(this.authRemoteDataSource) : super(LoginInitial());

  Future<void> sendOtp(String phoneNumber) async {
    logger.d("Phone Number===> $phoneNumber");
    emit(LoginLoading());
    try {
      await authRemoteDataSource.loginWithPhoneNumber(phoneNumber);
      emit(OtpSent());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
