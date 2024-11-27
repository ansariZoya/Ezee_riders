
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/payout_details.dart';
import 'package:driver_app/widgets/perform_data.dart';
import 'package:flutter/material.dart';
class DailyChart extends StatelessWidget {
  const DailyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          SizedBox(
            height: 174,width: 352,
            child: Padding(
              padding: const EdgeInsets.only(left: 13,right: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Performance of this Week",style: AppTextStyles.baseStyle,),
                  const SizedBox(height: 20,),
                  Container(
                    height: 100,width: 322,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFF5F5F5),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 17,
                          offset: Offset(0,4),
                          spreadRadius: 0,
                          color: Color(0xFFB7B7B7)
                        
                        )
                      ]
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: SizedBox(
                        height: 59,width: 286,
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      
                          children: [
                            PerformData(text: "Earning", value:"₹120.80"),
                             VerticalDivider(
                              thickness: 2,
                              endIndent: 10,
                              indent: 10,
                              color: Color(0xFFD9D9D9),
                            ),
                             PerformData(text: "Trip time", value:"1hr"),
                              VerticalDivider(
                              thickness: 2,
                              endIndent: 10,
                              indent: 10,
                              color: Color(0xFFD9D9D9),
                            ),
                              PerformData(text: "Rides", value:"4"),
                          ],
                        ),
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          ),const SizedBox(height: 40,),
                    const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Earning for Tuesday",style: AppTextStyles.baseStyle,),
                    Text("₹120.80",style: AppTextStyles.baseStyle,)
                  ],
            
                ),const SizedBox(height: 0,),                                        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Earning of last Tuesday",style: AppTextStyles.subtitle.copyWith(fontSize: 12),),
                    Text("₹300.09",style: AppTextStyles.subtitle.copyWith(fontSize: 12))
                  ],
                ),
                 const SizedBox(height: 20,),
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
        ],
      ),
    );
  }
}
  