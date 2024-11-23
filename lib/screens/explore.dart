
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/arrived_trip.dart';
import 'package:driver_app/widgets/time_line.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 300, left: 17, right: 17),
        child: Container(
          height: 280,
          width: 326,
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 17,
                    spreadRadius: 12,
                    offset: Offset(0, 4),
                    color: Color(0xFFDBDBDB))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 301,height:216,
              child: Column(
                children: [
                  SizedBox(
                    height: 55,width: 301,
                    child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Online payment",
                                    style: AppTextStyles.baseStyle.copyWith(
                                        color: const Color(0xFF818587))),
                                const TextSpan(
                                    text: ' ₹120.00',
                                    style: AppTextStyles.baseStyle)
                              ]),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Image.asset("assets/images/cancel.png")
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 24,
                        width: 71,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FB),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.av_timer,
                              color: Color(0xFF4257D3),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "2 min",
                              style: AppTextStyles.subtitle.copyWith(
                                  color: const Color(0xFF4257D3),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FB),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              color: Color(0xFF4257D3),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "2Km away",
                              style: AppTextStyles.subtitle.copyWith(
                                  color: const Color(0xFF4257D3),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  SizedBox(
                    width: 298,
                    height: 42,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF24A665),
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
                              .copyWith(color: const Color(0xFFFFFFFF)),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
