
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
   String correctOTP= '2345';
   GlobalKey formKey = GlobalKey();
    String otpStatus = "";
     final TextEditingController _otpController = TextEditingController();
     Color borderColor = const Color(0xFFD6D6D6);

  void validateOTP() {
    String enteredOTP = _otpController.text;

    setState(() {
      if (enteredOTP.isEmpty) {
        otpStatus = "Please enter the OTP";
        borderColor = const Color(0xFFE75356);
      } else if (enteredOTP == correctOTP) {
        otpStatus = "OTP Verified";
        borderColor = const Color(0xFF24A665);
      } else {
        otpStatus = "Incorrect OTP";
         borderColor = const Color(0xFFE75356);
      }
    });
  }

  Icon getStatusIcon(){
   if(otpStatus=="OTP Verified"){
    return const Icon(Icons.check_circle,color: Color(0xFF24A665),);
   }
  else if(otpStatus=="Incorrect OTP"){
    return const Icon(Icons.info,color: Color(0xFFE75356),);
   }
   else {
    return const Icon(Icons.info,color: Color(0xFFE75356),);
   }
  }
  @override
  Widget build(BuildContext context) {
    final defaultpintheme = PinTheme(
      width: 38,height: 38,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width:1,color: borderColor), // Dynamic border color
    ),
    );
    return Form(
      
       key: formKey,
      child: Column(
        
        children: [
        Pinput(
          controller: _otpController,
           defaultPinTheme: defaultpintheme,
          onCompleted: (value) => validateOTP(),), if (otpStatus.isNotEmpty)
          const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 18,right: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           getStatusIcon(),
                          Text(
                            otpStatus,
                            style: AppTextStyles.subtitle.copyWith(color: otpStatus == "OTP Verified"
                                  ? const Color(0xFF24A665)
                                  : const Color(0xFFE75356),
                            )
                            
                           ),
                        ],
                      ),
                    )
        
      ],));
  }
}