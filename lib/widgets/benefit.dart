
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Benefit extends StatefulWidget {
 const Benefit({super.key});

  @override
  State<Benefit> createState() => _BenefitState();
}

class _BenefitState extends State<Benefit> {
    final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20),
      child: Expanded(
        child: SizedBox(
          height: 178, width:360,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Benefit for you",style: AppTextStyles.headline,)),
                SizedBox(
                  height: 120,
                  child: PageView(children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                                         height: 123,width:311,
                                          decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: const Color(0xFFFFFFFF),
                                        boxShadow: const [
                                     BoxShadow(
                                       color: Color(0xFFB7B7B7),
                                       blurRadius: 17,spreadRadius: 0,offset: Offset(0, 4)
                                     ),
                                           ]),
                                           child:
                                          ListTile(
                                           leading: Image.asset('assets/images/rupees.png'),
                                           title: const Text("Earn upto ₹100 by inviting",style: AppTextStyles.baseStyle,),
                                           
                                           subtitle: Text("Invite your friends to drive in Ezee Riders and earn ₹100.",
                            style: AppTextStyles.headline.copyWith(fontSize: 10.72),),
                                          )
                                       ),
                     ),
                 Container(
                  height: 123,width:311,
                   decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: const Color(0xFFFFFFFF),
                 boxShadow: const [
              BoxShadow(
                color: Color(0xFFB7B7B7),
                blurRadius: 17,spreadRadius: 0,offset: Offset(0, 4)
              ),
                    ]),
                    child:
                   ListTile(
                    leading: Image.asset('assets/images/rupees.png'),
                    title: const Text("Earn upto ₹100 by inviting",style: AppTextStyles.baseStyle,),
                    
                    subtitle: Text("Invite your friends to drive in Ezee Riders and earn ₹100.",
                          style: AppTextStyles.headline.copyWith(fontSize: 10.72),),
                   )
                ),
                 Container(
                  height: 123,width:311,
                   decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: const Color(0xFFFFFFFF),
                 boxShadow: const [
              BoxShadow(
                color: Color(0xFFB7B7B7),
                blurRadius: 17,spreadRadius: 0,offset: Offset(0, 4)
              ),
                    ]),
                    child:
                   ListTile(
                    leading: Image.asset('assets/images/rupees.png'),
                    title: const Text("Earn upto ₹100 by inviting",style: AppTextStyles.baseStyle,),
                    
                    subtitle: Text("Invite your friends to drive in Ezee Riders and earn ₹100.",
                          style: AppTextStyles.headline.copyWith(fontSize: 10.72),),
                   )
                )
                  ],),
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
      ),
    );
  }
}