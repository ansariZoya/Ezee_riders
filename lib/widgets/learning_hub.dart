import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LearningHub extends StatefulWidget {
  const LearningHub({super.key});

  @override
  State<LearningHub> createState() => _LearningHubState();
}

class _LearningHubState extends State<LearningHub> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
      child: SizedBox(
          height: 248,
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Learning Hub",
                style: AppTextStyles.headline,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: PageView(
                  children: [
                    Container(
                      height: 155,
                      width: 253,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFFFFF),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xFFB7B7B7),
                                blurRadius: 17,
                                spreadRadius: 0,
                                offset: Offset(0, 4)),
                          ]),
                      child: Image.asset("assets/images/Learning_hub.png"),
                    ),
                    Container(
                      height: 155,
                      width: 253,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFFFFF),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xFFB7B7B7),
                                blurRadius: 17,
                                spreadRadius: 0,
                                offset: Offset(0, 4)),
                          ]),
                      child: Image.asset("assets/images/Learning_hub.png"),
                    ),
                    Container(
                      height: 155,
                      width: 253,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFFFFF),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xFFB7B7B7),
                                blurRadius: 17,
                                spreadRadius: 0,
                                offset: Offset(0, 4)),
                          ]),
                      child: Image.asset("assets/images/Learning_hub.png"),
                    )
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
          )),
    );
  }
}
