import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_string.dart';
import 'package:quick_opd/feature/authentication/presentation/bloc_cubit/login_cubit/login_cubit.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is OtpSent) {
          context.pushNamed(
            AppRoute.otpPage.name,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          persistentFooterButtons: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("I agree to the Terms & Conditions",
                      textAlign: TextAlign.center,
                      style: primaryTextStyle(size: 14)),
                ),
                10.sHeight,
              ],
            ),
          ],
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 700,
                  child: Image.asset("assets/images/bg.jpg", fit: BoxFit.cover),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  color: AppColor.whiteColor,
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      20.sHeight,
                      Image.asset("assets/images/logo.png", height: 72),
                      20.sHeight,
                      const Text("WELCOME IN QUICK OPD",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(
                        AppString.loginShortDescription,
                        textAlign: TextAlign.center,
                        style: secondaryTextStyle(),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Text("+91",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  counterText: "",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: phoneController,
                        builder: (context, value, child) {
                          return AppButtonWidget(
                            label: state is LoginLoading
                                ? "Sending..."
                                : "Continue",
                            btnColor: AppColor.primaryColor,
                            callback: value.text.length == 10
                                ? () => context
                                    .read<LoginCubit>()
                                    .sendOtp(phoneController.text)
                                : null,
                            btnWidth: 300,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
