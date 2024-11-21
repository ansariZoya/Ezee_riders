
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
class PaymentTrip extends StatelessWidget {
  const PaymentTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.only(top: 280,left: 17,right: 17,bottom: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFFFFFFF)

        ),
        child: Column(
          
          children: [
            //Text color have to be 'Roboto'
            Padding(
              padding: const EdgeInsets.only(top:40,bottom: 30),
              child: Column(
                children: [
                  Text("₹80.00",style: AppTextStyles.baseStyle.copyWith(fontSize: 32),),
                  Text("Cash to collect",style: AppTextStyles.smalltitle,)
                ],
              ),
            ),
        Padding(
          
          padding: const EdgeInsets.only(left: 20,right: 20),
          
          child: Column(
          
            children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Sub Total",style: AppTextStyles.subtitle,),
                
                 Text("₹100.00",style: AppTextStyles.subtitle,)
              ],),const SizedBox(height:20),
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Discount",style: AppTextStyles.subtitle,),
                 Text("₹00",style: AppTextStyles.subtitle,)
              ],),const SizedBox(height:20),
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Wallet",style: AppTextStyles.subtitle,),
                 Text("₹80.00",style: AppTextStyles.subtitle,)
              ],),
          ],),
        ),
           
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(children: [
                Text("Time",style: AppTextStyles.subtitle,),
                Text("15min",style: AppTextStyles.subtitle.copyWith(fontSize: 16),)
              ],),const SizedBox(width: 60,),
               Column(children: [
                Text("Distance",style: AppTextStyles.subtitle,),
                Text("5.2 Km",style: AppTextStyles.subtitle.copyWith(fontSize: 16),)
              ],)
            ],),const SizedBox(height: 20,),
            Text("Rate your customer",style: AppTextStyles.subtitle.copyWith(fontSize: 16),),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(height:27.8,width:29.26,child: Icon(Icons.star,color: Color(0xFF1C1B1F),)),
              SizedBox(height:27.8,width:29.26,child: Icon(Icons.star,color: Color(0xFF1C1B1F),)),
              SizedBox(height:27.8,width:29.26,child: Icon(Icons.star,color: Color(0xFF1C1B1F),)),
              SizedBox(height:27.8,width:29.26,child: Icon(Icons.star,color: Color(0xFF1C1B1F),)),
              SizedBox(height:27.8,width:29.26,child: Icon(Icons.star,color: Color(0xFF1C1B1F),))
            ],),
            const SizedBox(height: 100,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(height: 46,width: 437,
              decoration: const BoxDecoration(
                color: Color(0xFF24A665),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
                )
              ),
                
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Get ready for next ride",style: AppTextStyles.baseStyle2,)),
              ),
            )
            
            ],
        ),
      ),),
    );
  }
}