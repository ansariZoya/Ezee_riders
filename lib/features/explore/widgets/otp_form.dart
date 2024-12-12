import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:driver_app/utils/responsive_size.dart'; // Import ResponsiveSize class

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  String correctOTP = '2345';
  GlobalKey formKey = GlobalKey();
  String otpStatus = "";
  final TextEditingController _otpController = TextEditingController();
  Color borderColor = AppColors.bordersColor;

  void validateOTP() {
    String enteredOTP = _otpController.text;

    setState(() {
      if (enteredOTP.isEmpty) {
        otpStatus = "Please enter the OTP";
        borderColor =AppColors.redColor;
      } else if (enteredOTP == correctOTP) {
        otpStatus = "OTP Verified";
        borderColor = AppColors.greenColor;
      } else {
        otpStatus = "Incorrect OTP";
        borderColor = AppColors.redColor;
      }
    });
  }

  Icon getStatusIcon() {
    if (otpStatus == "OTP Verified") {
      return const Icon(Icons.check_circle, color: Color(0xFF24A665));
    } else if (otpStatus == "Incorrect OTP") {
      return const Icon(Icons.info, color: AppColors.redColor);
    } else {
      return const Icon(Icons.info, color: AppColors.redColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: ResponsiveSize.width(context, 38), // Updated with ResponsiveSize
      height: ResponsiveSize.height(context, 38), // Updated with ResponsiveSize
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: borderColor), // Dynamic border color
      ),
    );
    return Form(
      key: formKey,
      child: Column(
        children: [
          Pinput(
            controller: _otpController,
            defaultPinTheme: defaultPinTheme,
            onCompleted: (value) => validateOTP(),
          ),
          if (otpStatus.isNotEmpty) const SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(
                left: ResponsiveSize.width(context, 18),
                right: ResponsiveSize.width(context, 100)), // Updated with ResponsiveSize
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getStatusIcon(),
                Text(
                  otpStatus,
                  style: AppTextStyles.subtitle.copyWith(
                    color: otpStatus == "OTP Verified"
                        ? AppColors.greenColor
                        : AppColors.redColor
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
