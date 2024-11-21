import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WeeklyChallenges extends StatefulWidget {
  const WeeklyChallenges({super.key});

  @override
  State<WeeklyChallenges> createState() => _WeeklyChallengesState();
}

class _WeeklyChallengesState extends State<WeeklyChallenges> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
      child: SizedBox(
        width: 360,
        height: 183,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("  Weekly Challenges", style: AppTextStyles.headline),
            const SizedBox(
              height: 10,
            ),
            SizedBox( height: 130,
              child: PageView(
                children: [
                  Container(
                    width: 311,
                    height: 123,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFB7B7B7),
                              blurRadius: 17,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ends on 16 Sep 2024",
                                    style: AppTextStyles.baseStyle.copyWith(
                                        fontSize: 10.72,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text("Complete 20 trips and \n ₹100 extra",
                                    style: AppTextStyles.baseStyle),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("2/20 trips done",
                                    style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        fontSize: 10,
                                        color: Color(0xFF221E22)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),  Container(
                    width: 311,
                    height: 123,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFB7B7B7),
                              blurRadius: 17,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ends on 16 Sep 2024",
                                    style: AppTextStyles.baseStyle.copyWith(
                                        fontSize: 10.72,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text("Complete 20 trips and \n ₹100 extra",
                                    style: AppTextStyles.baseStyle),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("2/20 trips done",
                                    style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        fontSize: 10,
                                        color: Color(0xFF221E22)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  effect: const WormEffect(
                      dotWidth: 6.0,
                      dotHeight: 6,
                      dotColor: Color(0xFFD9D9D9),
                      activeDotColor: Color(0xFF221E22)),
                  count: 3,
                  controller: pageController,
                ),
              )
          ],
        ),
      ),
    );
  }
}
