import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
class PayOutScreen extends StatelessWidget {
  const PayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffffff),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 182,width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF4F4F4),
                
              ),
              child: Padding(
                   padding: const EdgeInsets.only(top: 20,left: 18,right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("Balance",style: AppTextStyles.baseStyle2.copyWith(color: const Color(0xFF221E22),
                          fontWeight: FontWeight.w600)),
                          Text("₹ 300.00",style: AppTextStyles.baseStyle2.copyWith(color: const Color(0xFF221E22),
                          fontWeight: FontWeight.w600))
                    ],),Text("Available cash limit: ₹ 300.00  ",style: AppTextStyles.baseStyle2.copyWith(color: 
                        const Color(0xFF221E22),fontSize: 10),),
                  
                    
                    const SizedBox(height: 10,),
                    const Divider(height: 1,color: Color(0xFF818587),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("Withdrawable amount",style: AppTextStyles.baseStyle2.copyWith(color: const Color(0xFF221E22),
                          fontWeight: FontWeight.w600)),
                          Text("₹ 300.00",style: AppTextStyles.baseStyle2.copyWith(color: const Color(0xFF221E22),
                          fontWeight: FontWeight.w600))
                    ],),
                    const SizedBox(height: 5,),
                    SizedBox(
                      width: 82,height: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("View details",style: AppTextStyles.baseStyle2.copyWith(
                            fontWeight: FontWeight.w600,color: const Color(0xFF24A665),
                            fontSize: 10
                          ),),
                          Container(
                            width: 12,height: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:  Color(0xFF24A665)
                            ),
                            child: const Icon(Icons.arrow_right_alt,size: 9,
                            color: Color(0xFFFFFFFF),),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 154,height: 38,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF24A665),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    )
                                  ),
                                  onPressed: (){}, child: Text("Deposit",
                                style: AppTextStyles.baseStyle2.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)
                                ),)),
                              ),
                               SizedBox(
                                width: 154,height: 38,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF818587),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    )
                                  ),
                                  onPressed: (){}, child: Text("Withdraw",
                                style: AppTextStyles.baseStyle2.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)
                                ),)),
                              )
                            ],
                          )
                
                  ],
                ),
              ),
            ),
          ),const SizedBox(height: 20,),
          Container(
            height: 73,width: 340,
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF5F5F5),),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tip balance: ₹0.00",style: AppTextStyles.baseStyle2.copyWith(
                            color: const Color(0xFF221E22),fontSize: 14,fontWeight: FontWeight.w600
                          ),),
                          Text("View",style: AppTextStyles.baseStyle2.copyWith(
                            color: const Color(0xFF24A665),fontSize: 10,fontWeight: FontWeight.w600
                          ),)
                        ],
                      ),
                      const SizedBox(height: 10,),
                       Row(
                        children: [
                          const SizedBox(
                            width: 12,height: 12,
                            child: Icon(Icons.emoji_objects,size: 9,color: Color(0xFF1C1B1F),),),
                            Text("Amount is sent to weekly payout if not withdrawn",
                            style: AppTextStyles.baseStyle2.copyWith(
                              fontSize: 10,color: const Color(0xFF221E22)
                            ),)
                        ],
                      )
                    ],
                  ),
                ),
          )
        ],
      ),
    );
  }
}