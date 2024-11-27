
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/withdraw_cash.dart';
import 'package:flutter/material.dart';
class SelectOptionPage extends StatelessWidget {
  const SelectOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212,width: 360,
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.only(top: 13,left: 13),
        child: Column(
          children: [
            const Center(
                child: SizedBox(
                  height: 3.5,
                  width: 40,
                  child: Divider(
                    thickness: 2,
                    endIndent: 2,
                    indent: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Text(
                    "Select an option",
                    style: AppTextStyles.baseStyle2.copyWith(
                      color: const Color(0xFF221E22),
                    ),
                  ),
                ),
              ),
              Card(
                borderOnForeground: true,
                shape: const Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9)
                  )
                ),
                color: const Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pay by UPI",style: AppTextStyles.baseStyle2.copyWith(
                      color: const Color(0xFF818587),fontWeight: FontWeight.w500
                    ),),
                    IconButton(onPressed: (){
                        Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>const WithdrawCash()));
                    }, icon: const SizedBox(
                      width: 6.02,height: 10.68,
                      child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0xFF1C1B1F),
                      ),
                    ))
                  ],
                ),
              ),
                     Card(
                borderOnForeground: true,
                shape: const Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9)
                  )
                ),
                color: const Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pay by debit card / Netbancking",style: AppTextStyles.baseStyle2.copyWith(
                      color: const Color(0xFF818587),fontWeight: FontWeight.w500
                    ),),
                    IconButton(onPressed: (){
                        Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>const WithdrawCash()));
                    }, icon: const SizedBox(
                      width: 6.02,height: 10.68,
                      child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0xFF1C1B1F),
                      ),
                    ))
                  ],
                ),
              ),
                    Card(
                borderOnForeground: true,
                shape: const Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9)
                  )
                ),
                color: const Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Deposit at Relance store",style: AppTextStyles.baseStyle2.copyWith(
                      color: const Color(0xFF818587),fontWeight: FontWeight.w500
                    ),),
                    IconButton(onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>const WithdrawCash()));
                    }, icon: const SizedBox(
                      width: 6.02,height: 10.68,
                      child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0xFF1C1B1F),
                      ),
                    ))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}