import 'package:driver_app/features/earning/widgets/daily_chart.dart';
import 'package:driver_app/features/earning/widgets/monthly%20_chart.dart';
import 'package:driver_app/features/earning/widgets/tab_bar_row.dart';
import 'package:driver_app/features/earning/widgets/weekly_chart.dart';
import 'package:driver_app/features/earning/widgets/weekly_earning.dart';
import 'package:driver_app/features/earning/widgets/weekly_perform.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  String selectedTab = "Weekly";
  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TabBarRow(selectedTab:selectedTab, onTapSelectedTab: (tab){
               WidgetsBinding.instance.addPostFrameCallback((_) {
    setState(() {
      selectedTab = tab;
    });
  });
            },),
            if(selectedTab=="Daily")...[
             const DailyChart(),
             Container(),
            ]else...[
              if(selectedTab=="Weekly") const WeeklyChart(),
              if(selectedTab=="Monthly") const MonthlyChart(),
                const SizedBox(height: 10,),
            const WeeklyPerformance(),
            const SizedBox(height: 30,),
            const WeeklyEarning(),
            ]

          
          ],
        ),
      ),
    );
  }
  
}