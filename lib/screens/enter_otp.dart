import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/end_trip.dart';
import 'package:driver_app/widgets/otp_form.dart';
import 'package:driver_app/widgets/time_line.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class EnterOtP extends StatefulWidget {
  const EnterOtP({super.key});

  @override
  State<EnterOtP> createState() => _EnterOtPState();
}

class _EnterOtPState extends State<EnterOtP> {
  String validpin = '2345';
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 590, left: 10, right: 10),
          child: Container(
            color: const Color(0xFFFFFFFF),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD9D9D9),
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: Color(0xFF4257D3),
                    ),
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      "0 min away",
                      style: AppTextStyles.baseStyle,
                    ),
                  ),
                  trailing: Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD9D9D9),
                    ),
                    child: const Icon(
                      Icons.message,
                      color: Color(0xFF4257D3),
                    ),
                  ),
                ),
                SizedBox(
                  width: 298,
                  height: 42,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: SlideAction(
                        outerColor: const Color(0xFF3BD286),
                        
                        onSubmit: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EndTrip()));
                          return null;
                        },
                        sliderButtonIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 5, bottom: 5),
                          child: Container(
                            height: 30,
                            width: 30,
                            
                            decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xFFFFFFFF),),
                            child: const Icon(Icons.two_wheeler,
                                color: Color(0xFF52D567)),
                          ),
                        ),
                        sliderButtonIconPadding: 2,
                        borderRadius: 24,
                        
                        text: "Start trip",
                        textStyle: AppTextStyles.smalltitle
                            .copyWith(color: const Color(0xFFFFFFFF))),
                  ),
                ),
                ListTile(
                    leading: Image.asset('assets/images/arrive.png'),
                    title: const Text(
                      "Ganesh Mahanta",
                      style: AppTextStyles.baseStyle,
                    ),
                    trailing: Container(
                      height: 17,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "4.4",
                            style: AppTextStyles.subtitle,
                          ),
                          const Icon(
                            Icons.star,
                            color: Color(
                              0xFFFFD600,
                            ),
                            size: 6,
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "OTP",
                        style: AppTextStyles.baseStyle,
                      )),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [OtpForm()],
                ),
                const SizedBox(
                  height: 10,
                ),
                TimeLinewidget(
                  isfirst: true,
                  islast: false,
                  isPast: true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Pickup at 2km away",
                          style: AppTextStyles.baseStyle
                              .copyWith(fontSize: 13.28)),
                      TextSpan(
                          text:
                              "\nDr. Rahalkar Hospital, Masanganj, Chhattisgarh \n 495001",
                          style: AppTextStyles.smalltitle),
                    ])),
                  ),
                ),
                TimeLinewidget(
                  isfirst: false,
                  islast: true,
                  isPast: false,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 5),
                    child: Text(" \n \n Drop Off 8km ",
                        style:
                            AppTextStyles.baseStyle.copyWith(fontSize: 13.28)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
