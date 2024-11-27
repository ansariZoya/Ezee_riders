import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/widgets/time_line.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class WithdrawInfo extends StatelessWidget {
  const WithdrawInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 21, left: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Color(0xFF24A665), shape: BoxShape.circle),
              child: const SizedBox(
                height: 13.5,
                width: 20.26,
                child: DecoratedIcon(
                  icon: Icon(
                    Icons.check,
                    color: Color(0xFFFFFFFF),
                  ),
                  decoration: IconDecoration(
                      border: IconBorder(width: 2, color: Color(0xFFFFFFFF))),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: const TextSpan(
                    style: TextStyle(color: Color(0xFF221E22), fontSize: 24),
                    children: [
                  TextSpan(
                      text: "₹", style: TextStyle(fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " 80.00",
                      style: TextStyle(fontWeight: FontWeight.w600))
                ])),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Withdraw successful",
              style: AppTextStyles.baseStyle,
            ),
            Text("To BANK OF INIDA XXXX 1234", style: AppTextStyles.smalltitle),
            const SizedBox(
              height: 20,
            ),
            //Add Robot fonto to the below text
            const Text(
              "Status",
              style: AppTextStyles.baseStyle,
            ),
            const TimeLineWidgetnew(
              isfirst: true,
              islast: false,
              child: Padding(
                padding: EdgeInsets.only(top: 17,left: 17),
                child: Text(
                  "14 Sep 2024, 10:42 AM "
                  "\ntxn ID 123456fd6789900099888",
                  style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),const TimeLineWidgetnew(
              isfirst: false,
              islast: false,
              child: Padding(
                padding: EdgeInsets.only(top: 17,left: 17),
                child: Text(
                  "Transfer initiated to your bank "
                  "\n14 Sep 2024, 9:42 PM",
                  style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const TimeLineWidgetnew(
              isfirst: false,
              islast: true,
              child: Padding(
                padding: EdgeInsets.only(top: 17,left: 17),
                child: Text(
                  "1Amount deposited in your bank"
                  "\n16 Sep 2024, 9:42 AM"
                  "\nUTR No. CMS7830837658",
                  style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
