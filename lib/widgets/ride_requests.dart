import 'package:driver_app/animated_widget/redline_animation.dart';
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';

class RideRequests extends StatelessWidget {
  const RideRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding:   const EdgeInsets.only(top: 20,bottom: 20,left: 20),
      child: SizedBox(
        height: 183,width: 360,
            child: Container(
      height: 123,width: 311,
      decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: const Color(0xFFFFFFFF),
      boxShadow: const [
        BoxShadow(
          color: Color(0xFFB7B7B7),
          blurRadius: 17,spreadRadius: 0,offset: Offset(0, 4)
        )
      ]),
      child:  Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Finding ride request", style: AppTextStyles.baseStyle),
          ),
          const SizedBox(
            height: 15,
          ),
          const RedLineAnimation(),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 59,
            width: 302,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Earnings",
                      style:AppTextStyles.baseStyle.copyWith(fontSize: 10.72),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "₹300",
                      style: AppTextStyles.baseStyle,
                    ),
                  ],
                ),
                const VerticalDivider(
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Trip Time",
                      style:AppTextStyles.baseStyle.copyWith(fontSize: 10.72),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "30 min",
                      style: AppTextStyles.baseStyle,
                    ),
                  ],
                ),
                const VerticalDivider(
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Rides",
                      style: AppTextStyles.baseStyle.copyWith(fontSize: 10.72),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "3",
                      style: AppTextStyles.baseStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          
        ],
      ),
            ),
          ),
    );
  }
}
