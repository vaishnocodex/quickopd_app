import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_string.dart';
import 'package:quick_opd/feature/authentication/presentation/bloc_cubit/otp_cubit/otp_cubit.dart';
import 'package:quick_opd/feature/authentication/presentation/widgets/otp_input_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final otpController = TextEditingController();

  @override
  void initState() {
    context.read<OtpCubit>().startOtpTimer();
    super.initState();
  }

  @override
  void dispose() {
    context.read<OtpCubit>().close();
    otpController.clear();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.keyboard_backspace_sharp),
        ),
        titleSpacing: 8,
        title: Text("Back", style: boldTextStyle(size: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.sHeight,
            Text(AppString.verifyMobile, style: boldTextStyle(size: 24)),
            6.sHeight,
            Text(
              AppString.otpSend4Digits,
              style: primaryTextStyle(
                  size: 15, color: AppColor.textSecondaryColor),
            ),
            10.sHeight,
            Text(
              context.read<OtpCubit>().maskPhoneNumber("+91 9518202535"),
              style: boldTextStyle(
                size: 16,
              ),
            ),
            26.sHeight,
            OTPInputWidget(controller: otpController),
            28.sHeight,
            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                print("State===== ${state}");
                isLoading = state is OtpResendLoading ? true : false;
              },
              builder: (context, state) {
                bool isLoading = state is OtpResendLoading ||
                    state is OtpVerificationLoading;
                // print("Current State: $state");
                if (state is OTPTimerRunning) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppString.resendOTP, style: primaryTextStyle()),
                      Text(
                        state.remainingTime,
                        style: boldTextStyle(),
                      ),
                    ],
                  );
                } else if (state is CounterComplete) {
                  return isLoading
                      ? const CircularProgressIndicator(
                          color: AppColor.blackColor,
                        )
                      : TextButton(
                          onPressed: () {
                            context.read<OtpCubit>().resendOtp("9518202535");
                          },
                          child: Text(
                            AppString.resendBtn,
                            style: boldTextStyle(
                              size: 17,
                              color: AppColor.textSecondaryColor,
                            ),
                          ),
                        );
                }
                return const SizedBox.shrink();
              },
            ),
            30.sHeight,
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: otpController,
              builder: (context, value, child) {
                return BlocBuilder<OtpCubit, OtpState>(
                  builder: (context, state) {
                    return AppButtonWidget(
                      callback: otpController.text.length == 4
                          ? () {
                              context.read<OtpCubit>().verifyOtp(
                                    "9518202535",
                                    otpController.text,
                                  );
                              context.pushNamed(AppRoute.personalDetails.name);
                            }
                          : null,
                      label: state is OtpVerificationLoading
                          ? "Loading..."
                          : AppString.otpVerifyBtn,
                    );
                  },
                );
              },
            ),
            20.sHeight,
          ],
        ),
      ),
    );
  }
}
