
import 'package:driver_app/features/explore/widgets/cancel.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/features/explore/screens/arrived_trip.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:driver_app/features/explore/widgets/time_line.dart';
import 'package:flutter/material.dart';


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: ResponsiveSize.height(context, 428)),
        child: Padding(
          padding:EdgeInsets.symmetric(
            horizontal: ResponsiveSize.height(context, 12),
            vertical: ResponsiveSize.width(context, 16),
          ),
          child: Container(
            height: ResponsiveSize.height(context, 285),
            width: ResponsiveSize.width(context, 326),
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 17,
                      spreadRadius: 12,
                      offset: Offset(0, 4),
                      color: AppColors.newShadowColor)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width:  ResponsiveSize.width(context, 301),
                height:ResponsiveSize.height(context, 216),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Online payment",
                                    style: AppTextStyles.baseStyle.copyWith(
                                        color: AppColors.greytextColor)),
                                const TextSpan(
                                    text: ' ₹120.00',
                                    style: AppTextStyles.baseStyle)
                              ]),
                            ),
                            SizedBox(
                              width: ResponsiveSize.width(context, 70),
                            ),
                           const CancelProgress()
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: ResponsiveSize.height(context, 24,),
                          width: ResponsiveSize.width(context, 71),
                          decoration: BoxDecoration(
                            color: AppColors.newBoxColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                             
                                Image.asset('assets/images/acute.jpg',height: 16,width: 16,fit: BoxFit.fill,),
                              
                               SizedBox(
                                width: ResponsiveSize.width(context, 5)
                              ),
                              Text(
                                "12 min",
                                style: AppTextStyles.subtitle.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      
                        Container(
                         height: ResponsiveSize.height(context, 24,),
                          width: ResponsiveSize.width(context, 88),
                          decoration: BoxDecoration(
                            color:AppColors.newBoxColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_sharp,
                                color: AppColors.primaryColor
                              ),
                            SizedBox(
                                width: ResponsiveSize.width(context, 5)
                              ),
                              Text(
                                "2Km away",
                                style:  AppTextStyles.subtitle.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ResponsiveSize.height(context, 75),
                      child: TimeLinewidget(
                        isfirst: true,
                        islast: false,
                        isPast: true,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top:30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pickup at 2km away",
                                style: AppTextStyles.baseStyle
                                    .copyWith(fontSize: 13.28)),
                                    SizedBox(height: ResponsiveSize.height(context, 1),),
                          Text("Dr. Rahalkar Hospital, Masanganj, Chhattisgarh 495001",
                                style: AppTextStyles.smalltitle)
                            ],
                          )
                        ),
                      ),
                    ),
                    TimeLinewidget(
                      isfirst: false,
                      islast: true,
                      isPast: false,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, ),
                        child: Text("Drop Off 8km ",
                            style:
                                AppTextStyles.baseStyle.copyWith(fontSize: 13.28)),
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveSize.height(context, 298),
                      height: ResponsiveSize.width(context, 42),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greenColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ArrivedTrip()));
                          },
                          child: Text(
                            "Accept",
                            style: AppTextStyles.smalltitle
                                .copyWith(color: AppColors.backgroundColor),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
