import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';

class OTPInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const OTPInputWidget({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  OTPInputWidgetState createState() => OTPInputWidgetState();
}

class OTPInputWidgetState extends State<OTPInputWidget> {
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle: boldTextStyle(size: 22, color: AppColor.blackk87),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(232, 235, 241, 0.37),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
    );

    return Pinput(
      length: 4,
      controller: widget.controller,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 12),
      showCursor: true,
      onChanged: widget.onChanged,
    );
  }
}
