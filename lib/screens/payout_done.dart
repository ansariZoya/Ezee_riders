
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/withdraw_info.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';
class PayoutDone extends StatelessWidget {
  const PayoutDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const SizedBox(
                height: 11.31,
                width: 6.71,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF1C1B1F),
                ))),
        title: Text(
          "Withdraw",
          style: AppTextStyles.baseStyle.copyWith(fontSize: 18.72),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Center(
              child: Container(
                height: 100,width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF24A665)
                ),
                child:const DecoratedIcon(icon: Icon(Icons.check,color: Color(0xFFFFFFFF),size: 54,),
                decoration: IconDecoration(
                  border: IconBorder(
                    width: 10,
                    color: Color(0xffffffffff),
                    
                  )
                ),)
              ),
            ),
          ),
          RichText(text: const TextSpan(
            //Add Roboto font here...I dont have roboto
            style: TextStyle(
              color: Color(0xFF221E22),fontSize: 24
            ),
            children: [
              TextSpan(text: "₹ 300.00",style: TextStyle(fontWeight: FontWeight.w600)),
              TextSpan(text: " cashed out \n       successfully!",style: TextStyle(fontWeight: FontWeight.w500))
            ]
          )),
           Align(
            alignment: Alignment.center,
            child: Text("Withdrawn amount may take 2-3 business days " 
                               "\n                 to reflect on your back account",style: AppTextStyles.smalltitle,)),
                               const Spacer(),
                                Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> const WithdrawInfo()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color(0xFF4257D3),
                  minimumSize: const Size(328, 48),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
     
    );
  }
}