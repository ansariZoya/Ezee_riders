import 'package:driver_app/features/emergency_contact/screens/emergency_contact.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/features/explore/screens/call_screen.dart';
import 'package:driver_app/features/explore/screens/enter_otp.dart';
import 'package:driver_app/features/explore/screens/message_screen.dart';
import 'package:driver_app/features/explore/screens/ride_cancel.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:driver_app/features/explore/widgets/time_line.dart';
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
                insetPadding: const EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                backgroundColor: AppColors.backgroundColor,
                child: SizedBox(
               height: ResponsiveSize.height(context, 249),
                              width: ResponsiveSize.width(context, 326),
                  child: Column(
                    children: [
                       SizedBox(
                        height:  ResponsiveSize.height(context, 32),
                      ),
                      Image.asset("assets/images/red.png"),
                      SizedBox(
                        height: ResponsiveSize.height(context,20),
                      ),
                      Text(
                        "Call your emergency contact?",
                        style: AppTextStyles.headline3,
                      ),
                       SizedBox(
                        height:  ResponsiveSize.height(context, 5),
                      ),
                      Text(
                        "Your location will be shared with your \nemergency contact along with it!",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.smalltitle,
                      ),
                       SizedBox(
                        height:  ResponsiveSize.height(context, 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height:  ResponsiveSize.height(context, 42),
                            width:  ResponsiveSize.width(context, 136),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.backgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancel',
                                style: AppTextStyles.baseStyle2.copyWith(color: AppColors.newgreyColor),
                              ),
                            ),
                          ),
                          // 'Call' button
                          SizedBox(
                              height:  ResponsiveSize.height(context, 42),
                            width:  ResponsiveSize.width(context, 136),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:AppColors.redColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              Navigator.push(
                                context, // Use the original context to navigate
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EmergencyContact(),
                                ),
                              );
                              },
                              child:  Row(
                                children: [
                                  const Icon(
                                    Icons.call,
                                    color: AppColors.backgroundColor
                                  ),
                                  SizedBox(width: ResponsiveSize.width(context, 4)),
                                  const Text(
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
                  insetPadding: const EdgeInsets.only(left: 17, right: 17),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  backgroundColor: AppColors.backgroundColor,
                  child: SizedBox(
                    height:  ResponsiveSize.height(context, 249),
                    width:  ResponsiveSize.width(context, 326),
                    child: Column(
                      children: [
                         SizedBox(
                          height:  ResponsiveSize.height(context, 32),
                        ),
                        Image.asset("assets/images/red.png"),
                         SizedBox(height:  ResponsiveSize.height(context,10),),
                        Text("Do you wanna cancel pickup?",
                            style: AppTextStyles.headline3),
                         SizedBox(
                          height: ResponsiveSize.height(context, 5),
                        ),
                        Text(
                          "You cannot undo this action!",
                          style: AppTextStyles.smalltitle,
                        ),
                        SizedBox(
                          height: ResponsiveSize.height(context, 5),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: " 9",
                              style: AppTextStyles.smalltitle
                                  .copyWith(color: AppColors.redColor)),
                          TextSpan(
                              text: "/10 cancellation left ",
                              style: AppTextStyles.smalltitle)
                        ])),
                         SizedBox(
                          height: ResponsiveSize.height(context, 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: ResponsiveSize.height(context, 42),
                              width: ResponsiveSize.width(context, 130),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.backgroundColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child:  Text(
                                    'No',
                                    style: AppTextStyles.baseStyle2.copyWith(color: AppColors.newgreyColor),
                                  )),
                            ),
                            SizedBox(
                              height: ResponsiveSize.height(context, 42),
                              width: ResponsiveSize.width(context, 130),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.redColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
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
            height: ResponsiveSize.height(context, 444),
            width: ResponsiveSize.width(context, 360),
            color: AppColors.backgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: ListTile(
                    leading: Container(
                        height: ResponsiveSize.height(context, 36),
                        width: ResponsiveSize.width(context, 36),
                        decoration:  const BoxDecoration(
                          shape: BoxShape.circle,
                          color:AppColors.purplebackground

                        ),
                        child: IconButton(
                          icon: const Center(
                            child: Icon(
                              Icons.phone,
                              color: AppColors.primaryColor
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CallScreen(),
                                ));
                          },
                        )),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Text(
                        "0 min away",
                        style: AppTextStyles.baseStyle,
                      ),
                    ),
                    trailing: Container(
                        height: ResponsiveSize.height(context, 36),
                        width: ResponsiveSize.width(context, 36),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                           color:AppColors.purplebackground
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.message,
                            color:AppColors.primaryColor
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
                ),
                Container(
                  height: ResponsiveSize.height(context, 46),
                  width: ResponsiveSize.width(context, 278.56),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(28)),
                  child: SlideAction(
                      onSubmit: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EnterOtP()));
                        return null;
                      },
                      outerColor: AppColors.greenColor,
                      sliderButtonIcon: Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                        ),
                        child: Container(
                          height: ResponsiveSize.height(context, 40),
                          width: ResponsiveSize.width(context, 40),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:AppColors.backgroundColor,
                          ),
                          child: const Icon(Icons.two_wheeler,
                              size: 19, color: AppColors.newgreenColor),
                        ),
                      ),
                      sliderButtonIconPadding: 2,
                      text: "Arrived",
                      textStyle: AppTextStyles.smalltitle
                          .copyWith(color: AppColors.backgroundColor)),
                ),
                
                Padding(
                  padding: EdgeInsets.only(
                      top: ResponsiveSize.height(context, 17),
      
                ),
                  child: ListTile(
                      leading: Image.asset('assets/images/Ganesh.png'),
                      title: const Text(
                        "Ganesh Mahanta",
                        style: AppTextStyles.baseStyle,
                      ),
                      trailing: Container(
                        height: ResponsiveSize.height(context, 17),
                        width: ResponsiveSize.height(context, 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color:  AppColors.backgroundColor,
                            border: Border.all(color:  AppColors.newgreyColor)),
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
                ),  SizedBox(
                  height: ResponsiveSize.height(context, 10),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: SizedBox(
                    height: ResponsiveSize.height(context, 80),
                    child: TimeLinewidget(
                      isfirst: true,
                      islast: false,
                      isPast: true,
                      child: SizedBox(
                            height: ResponsiveSize.height(context, 70),
                        child: Padding(
                                            padding: EdgeInsets.only(
                        left: ResponsiveSize.width(context, 8),
                        top: ResponsiveSize.height(context, 20),
                                            ),
                                            child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Pickup at",
                                
                                  style: AppTextStyles.baseStyle.copyWith(
                                    fontSize:16
                                  )),
                            
                            ])),
                          ),
                          Text("Dr. Rahalkar Hospital, Masanganj, Chhattisgarh 495001",
                                style: AppTextStyles.smalltitle)
                        ],
                                            ),
                                          ),
                      ),
                    
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
                      padding: const EdgeInsets.only(left: 8,),
                      child: Text(" Drop Off ",
                          style: AppTextStyles.baseStyle
                              .copyWith(fontSize: 16)),
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
                  padding: EdgeInsets.symmetric(
                    vertical: ResponsiveSize.height(context, 11),
                    horizontal: ResponsiveSize.height(context, 24),
                  ),
                  child: SizedBox(
                    width:  ResponsiveSize.width(context, 327),
                    height:  ResponsiveSize.height(context,49),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          _showDialogebox2();
                        },
                        child: Text(
                          "SOS",
                          style: AppTextStyles.smalltitle
                              .copyWith(color:AppColors.backgroundColor),
                        )),
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
