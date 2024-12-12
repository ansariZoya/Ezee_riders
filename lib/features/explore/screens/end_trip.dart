import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/features/explore/screens/explore_payment.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:driver_app/features/explore/widgets/time_line.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';


class EndTrip extends StatelessWidget {
  const EndTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(
              top: ResponsiveSize.height(context, 588),
              left: ResponsiveSize.width(context, 10),
              right: ResponsiveSize.width(context, 10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: ResponsiveSize.height(context, 36),
                    width: ResponsiveSize.width(context, 36),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.purplebackground
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(
                      left: ResponsiveSize.width(context, 60),
                    ),
                    child: const Text(
                      "0 min away",
                      style: AppTextStyles.baseStyle,
                    ),
                  ),
                  trailing: Container(
                    height: ResponsiveSize.height(context, 36),
                    width: ResponsiveSize.width(context, 36),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.purplebackground
                    ),
                    child: const Icon(
                      Icons.message,
                      color: AppColors.primaryColor,
                    ),
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
                                builder: (context) => const PaymentTrip()));
                        return null;
                      },
                      outerColor: AppColors.greenColor,
                      sliderButtonIcon: Padding(
                        padding: const EdgeInsets.only(
                          left: 2.56,
                        ),
                        child: Container(
                          height: ResponsiveSize.height(context, 40),
                          width: ResponsiveSize.width(context, 40),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.backgroundColor
                          ),
                          child: const Icon(Icons.two_wheeler,
                              size: 19, color: AppColors.newgreenColor),
                        ),
                      ),
                      sliderButtonIconPadding: 2,
                      text: "End trip",
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
                      width: ResponsiveSize.width(context, 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ResponsiveSize.width(context, 12)),
                        color: AppColors.backgroundColor
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
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
                SizedBox(
                  height: ResponsiveSize.height(context, 10),
                ),
                TimeLinewidget(
                  isfirst: true,
                  islast: false,
                  isPast: true,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: ResponsiveSize.width(context, 8),
                      top: ResponsiveSize.height(context, 25),
                    ),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Pickup at",
                          style: AppTextStyles.baseStyle.copyWith(
                            fontSize:16
                          )),
                      TextSpan(
                          text:
                              "\nDr. Rahalkar Hospital, Masanganj, Chhattisgarh 495001",
                          style: AppTextStyles.smalltitle),
                    ])),
                  ),
                ),
                TimeLinewidget(
                  isfirst: false,
                  islast: true,
                  isPast: false,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: ResponsiveSize.width(context, 8),
                      bottom: ResponsiveSize.height(context, 5),
                    ),
                    child: Text(
                      " Drop Off ",
                      style: AppTextStyles.baseStyle.copyWith(
                        fontSize: 16
                      ),
                    ),
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
