import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/widgets/perform_data.dart';
import 'package:flutter/material.dart';

class WeeklyPerformance extends StatelessWidget {
  const WeeklyPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 174,width: 352,
      child: Padding(
        padding: const EdgeInsets.only(left: 13),
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
                      PerformData(text: "Earning", value:"₹300"),
                       VerticalDivider(
                        thickness: 2,
                        endIndent: 10,
                        indent: 10,
                        color: Color(0xFFD9D9D9),
                      ),
                       PerformData(text: "Trip time", value:"30 min"),
                        VerticalDivider(
                        thickness: 2,
                        endIndent: 10,
                        indent: 10,
                        color: Color(0xFFD9D9D9),
                      ),
                        PerformData(text: "Rides", value:"50"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}