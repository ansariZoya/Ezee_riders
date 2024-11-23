import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/call_screen.dart';
import 'package:driver_app/screens/enter_otp.dart';
import 'package:driver_app/screens/message_screen.dart';
import 'package:driver_app/screens/ride_cancel.dart';
import 'package:driver_app/widgets/time_line.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ArrivedTrip extends StatefulWidget {
  const ArrivedTrip({super.key});

  @override
  State<ArrivedTrip> createState() => _ArrivedTripState();
}

class _ArrivedTripState extends State<ArrivedTrip> {
  void _showDialogebox2() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            top: 207,
            child: Dialog(
              
              insetPadding: const EdgeInsets.only(left: 17,right: 17,),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              backgroundColor: const Color(0xFFFFFFFF),
              child: SizedBox(
                height: 249,width: 326,
                child: Column(
                  children: [
                    const SizedBox(height: 12,),
                    Image.asset("assets/images/red.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Call your emergency contact?",
                      style: AppTextStyles.headline3,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Your location will be shared with your \nemergency contact along with it!",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.smalltitle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       
                        SizedBox(
                          height: 42,
                          width: 136,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Cancel',
                              style: AppTextStyles.baseStyle2,
                            ),
                          ),
                        ),
                        // 'Call' button
                        SizedBox(
                          height: 42,
                          width: 136,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE75356),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () {
                              // Add your call functionality here
                            },
                            child: const Row(
                              
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Color(0xFFFFFFFF),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Call',
                                  style: AppTextStyles.baseStyle2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}


  void _showDialogebox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children: [
              Positioned(
                 top: 207,
                child: Dialog(
                  insetPadding: const EdgeInsets.only(left: 17,right: 17),
                    shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                          backgroundColor: const Color(0xFFFFFFFF),
                    
                child:SizedBox(
                        height: 249,
                        width: 326,
                        child: Column(
                         
                          children: [
                             const SizedBox(height: 12,),
                            Image.asset("assets/images/red.png"),
                            const SizedBox(
                              height: 3
                            ),
                            Text("Do you wanna cancel pickup?",
                                style: AppTextStyles.headline3),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "You cannot undo this action!",
                              style: AppTextStyles.smalltitle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: " 9",
                                  style: AppTextStyles.smalltitle
                                      .copyWith(color: const Color(0xFFE57356))),
                              TextSpan(
                                  text: "/10 cancellation left ",
                                  style: AppTextStyles.smalltitle)
                            ])),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 42,
                                  width: 100,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey[200],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8))),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'No',
                                        style: AppTextStyles.baseStyle2,
                                      )),
                                ),
                                SizedBox(
                                  height: 42,
                                  width: 100,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFE75356),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RideCancel()));
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: AppTextStyles.baseStyle2,
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
              ),
            ],
          );
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
                padding: const EdgeInsets.only(top: 570),
                child: Container(
            color: const Color(0xFFFFFFFF),
            child: Column(
              children: [
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFD9D9D9),
                      ),
                      child: IconButton(icon:   const Icon(
                        Icons.phone,
                        color: Color(0xFF4257D3),
                      ) , onPressed: () { 
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CallScreen(),
                              ));
                       },)
                      
                    
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
                      child: IconButton(
                        icon: const Icon(
                          Icons.message,
                          color: Color(0xFF4257D3),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MessageScreen(),
                              ));
                        },
                      )),
                ),
                SizedBox(
                  width: 298,
                  height: 42,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: SlideAction(
                        onSubmit: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EnterOtP()));
                          return null;
                        },
                        outerColor: const Color(0xFF24A665),
                        sliderButtonIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 5, bottom: 5),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                            ),
                            child: const Icon(Icons.two_wheeler,
                                color: Color(0xFF52D567)),
                          ),
                        ),
                        sliderButtonIconPadding: 2,
                        borderRadius: 24,
                        text: "Arrived",
                        textStyle: AppTextStyles.smalltitle
                            .copyWith(color: const Color(0xFFFFFFFF))),
                  ),
                ),
                ListTile(
                    leading: Image.asset('assets/images/Ganesh.png'),
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
                        border: Border.all(
                          color: const Color(0xFF888888)
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: TimeLinewidget(
                    isfirst: true,
                    islast: false,
                    isPast: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Pickup at",
                            style:
                                AppTextStyles.baseStyle.copyWith(fontSize: 13.28)),
                        TextSpan(
                            text:
                                "\n Dr. Rahalkar Hospital, Masanganj, Chhattisgarh \n 495001",
                            style: AppTextStyles.smalltitle),
                      ])),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: TimeLinewidget(
                    isfirst: false,
                    islast: true,
                    isPast: false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(" Drop Off ",
                          style: AppTextStyles.baseStyle.copyWith(fontSize: 13.28)),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _showDialogebox();
                  },
                  child: Text("Cancel ride",
                      style: AppTextStyles.headline3
                          .copyWith(fontWeight: FontWeight.w400)),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(top:11,right: 24,bottom: 24,left: 11),
                  child: SizedBox(
                    width: 298,
                    height: 42,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE75356),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          _showDialogebox2();
                        },
                        child: Text(
                          "SOS",
                          style: AppTextStyles.smalltitle
                              .copyWith(color: const Color(0xFFFFFFFF)),
                        )),
                  ),
                )
              ],
            )),
              ),
        ));
  }
}
