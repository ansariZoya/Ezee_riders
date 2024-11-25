
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class MonthlyChart extends StatelessWidget {
  const MonthlyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SizedBox(
          width: 314, height: 136,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: [
                BarChartGroupData(x: 1,
                barRods: [
                  BarChartRodData(toY: 0,color: const Color(0xFFF4F4F4),width: 24,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  )
                ]),
                 BarChartGroupData(x: 2, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 477,color: const Color(0xFFF4F4F4),width: 24,
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  ),
                  
                ]),
                  BarChartGroupData(x: 3, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 80,width: 24,color: const Color(0xFFF4F4F4),
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))
                  ),
                  
                ]),
                 BarChartGroupData(x: 4, barsSpace: 10,
                barRods: [
                  BarChartRodData(toY: 400,width: 24,color: const Color(0xFFF4F4F4),
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
                  
                ]), 
              ],
                          titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles:false,),
                    ) ,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return  Padding(
                                padding: const EdgeInsets.only(top: 12,left: 2),
                                child: Text('1-1 sep',style: AppTextStyles.chartstyle,),
                              );
                            case 2:
                              return  Padding(
                               padding: const EdgeInsets.only(top: 12,left: 2),
                                child: Text('2-8 sep',style: AppTextStyles.chartstyle,),
                              );
                              case 3:
                          return  Padding(
                            padding: const EdgeInsets.only(top:12,left: 2),
                            child: Text("9-15sep",style: AppTextStyles.chartstyle),
                          );
                           case 4:
                          return Padding(
                           padding: const EdgeInsets.only(top: 12,left: 2),
                            child: Text("16-22sep",style: AppTextStyles.chartstyle),
                          );
                          case 5:
                           return  Padding(
                             padding: const EdgeInsets.only(top: 12,left: 2),
                             child: Text("25-29sep",style: AppTextStyles.chartstyle),
                           );
                           case 6:
                            return Padding(
                             padding: const EdgeInsets.only(top: 12,left: 2),
                              child: Text("30-30sep",style: AppTextStyles.chartstyle),
                            );
                         
                        
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
        ),
         Positioned.fill(child: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  left: constraints.maxWidth * 0.02,
                      top: constraints.maxHeight * 0.85,
                  child:Text(
                        "-₹80",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12,color: const Color(0xFFE75356)),
                      ),),  Positioned(
                      left: constraints.maxWidth * 0.20,
                      top: constraints.maxHeight * 0,
                      child: Text(
                        "₹477",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.40,
                      top: constraints.maxHeight * 0.55,
                      child: Text(
                        "₹0",
                        style: AppTextStyles.chartstyle.copyWith(fontSize: 12),
                      ),
                    ),
                     Positioned(
                      left: constraints.maxWidth * 0.55,
                      top: constraints.maxHeight * 0.1,
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
    );
  }
}