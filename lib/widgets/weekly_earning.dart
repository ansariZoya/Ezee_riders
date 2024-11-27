
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/payout_details.dart';
import 'package:flutter/material.dart';
class WeeklyEarning extends StatelessWidget {
  const WeeklyEarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right:15),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Earning of this week",style: AppTextStyles.baseStyle,),
              Text("₹477.98",style: AppTextStyles.baseStyle,)
            ],
      
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Earning of last week",style: AppTextStyles.subtitle.copyWith(fontSize: 12),),
              Text("₹560.09",style: AppTextStyles.subtitle.copyWith(fontSize: 12))
            ],
          ),
          SizedBox(
            height: 254, width:327,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>const PayoutDetails()));
                    },
                    leading: Container(
                      height: 28,width: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF4257D3)
                      ),
                      child: const Icon(Icons.two_wheeler,color: Color(0xFFFFFFFF),)),
                    title: const Text("Trip Earning",style: AppTextStyles.baseStyle,),
                    subtitle: Text("Earning per trip",style: AppTextStyles.smalltitle.copyWith(fontSize: 10.72),),
                    trailing: const Text("₹80.89",style: AppTextStyles.baseStyle,),
                  ),
                   ListTile(
                    leading: Container(
                      height: 28,width: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF8A00)
                      ),
                      child: const Icon(Icons.bolt,color: Color(0xFFFFFFFF),)),
                    title: const Text("Surge Pay",style: AppTextStyles.baseStyle,),
                    subtitle: Text("Extra pay during certain time slots",style: AppTextStyles.smalltitle.copyWith(fontSize: 10.72),),
                    trailing: const Text("₹8.89",style: AppTextStyles.baseStyle,),
                  ),
                    ListTile(
                    leading: Container(
                      height: 28,width: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF7000FF)
                      ),
                      child: const Icon(Icons.thumb_up,color: Color(0xFFFFFFFF),)),
                    title: const Text("Customer Tips",style: AppTextStyles.baseStyle,),
                    trailing: const Text("₹8.89",style: AppTextStyles.baseStyle,),
                  ),
                     ListTile(
                      tileColor: const Color(0xFFF4F4F4),
                    leading: Container(
                      height: 28,width: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF818587)
                      ),
                      child: const Icon(Icons.currency_rupee,color: Color(0xFFFFFFFF),)),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         Text("Offers",style: AppTextStyles.baseStyle.copyWith(color: const Color(0xFF818587)),),
                        
                              Container(
                                height: 14,width: 59,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE75356),
                                  borderRadius: BorderRadius.circular(9)
                                ),
                                child: Text("Coming Soon",style: AppTextStyles.baseStyle2.copyWith(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 8
                                ),),
                              )
                      ],
                    ),
                    trailing:  Text("₹0.00",style: AppTextStyles.baseStyle.copyWith(color: const Color(0xFF818587)),),
                  ),
                  const SizedBox(height: 10,),
                  Text("Settlement will be calculated at the end of week",style: AppTextStyles.baseStyle2.copyWith(color: const Color(0xFF221E22)),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}