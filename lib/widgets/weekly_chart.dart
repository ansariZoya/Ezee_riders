
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 314, height: 136,
      child: Stack(
        children: [
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: [
                BarChartGroupData(x: 1,barsSpace: 5,
                barRods: [
                  BarChartRodData(toY: 477,
                  color: const Color(0xFFF4F4F4),width: 24,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  )
                ]),
                 BarChartGroupData(x: 2, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 80,color: const Color(0xFF4257D3),width: 24,
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  ),
                  
                ]),
                  BarChartGroupData(x: 3, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 0,width: 24,
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  ),
                  
                ]),
                 BarChartGroupData(x: 4, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 0,width: 24,
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  ),
                  
                ]),
                 BarChartGroupData(x: 5, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 0,width: 24,
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  
                  ),
                  
                ]), BarChartGroupData(x: 6, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 0,width: 24,
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  ),
                  
                ]), BarChartGroupData(x: 7, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 0,width: 24,
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  ),
                  
                ])
              ],
                          titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false,
                      ),
                    ) ,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return  Text('Sep 17',style: AppTextStyles.chartstyle,);
                            case 2:
                              return  Text('Sep 17',style: AppTextStyles.chartstyle,);
                              case 3:
                          return  Text("18",style: AppTextStyles.chartstyle);
                           case 4:
                          return Text("19",style: AppTextStyles.chartstyle);
                          case 5:
                           return  Text("20",style: AppTextStyles.chartstyle);
                           case 6:
                            return Text("21",style: AppTextStyles.chartstyle);
                          case 7:
                           return  Text("22",style: AppTextStyles.chartstyle);
                        
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      
                    ),
                  ),
                   gridData: const FlGridData(show:false ),
                   borderData: FlBorderData(show: true,
                    border: const Border(
                      bottom: BorderSide(
                        color: Color(0xFF000000),
                        width: 1
                      ),
                      right: BorderSide.none,
                      left: BorderSide.none,
                      top: BorderSide.none
                    )
                   ),
          
            
              
            )
          
          ),
          Positioned.fill(child: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  left: constraints.maxWidth * 0.02,
                      top: constraints.maxHeight * 0,
                  child:Text(
                        "₹477",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),),  Positioned(
                      left: constraints.maxWidth * 0.17,
                      top: constraints.maxHeight * 0.55,
                      child: Text(
                        "₹80",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.34,
                      top: constraints.maxHeight * 0.7,
                      child: Text(
                        "₹0",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),
                    ),
                     Positioned(
                      left: constraints.maxWidth * 0.48,
                      top: constraints.maxHeight * 0.7,
                      child: Text(
                        "₹0",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),
                    ),
                     Positioned(
                      left: constraints.maxWidth * 0.62,
                      top: constraints.maxHeight * 0.7,
                      child: Text(
                        "₹0",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),
                    ),
                     Positioned(
                      left: constraints.maxWidth * 0.75,
                      top: constraints.maxHeight * 0.7,
                      child: Text(
                        "₹0",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),
                    ),
                      Positioned(
                      left: constraints.maxWidth * 0.90,
                      top: constraints.maxHeight * 0.7,
                      child: Text(
                        "₹0",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),
                    ),
              ],
            );
          },))
        ],
      ),
    );
  }
}