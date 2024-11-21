
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
class TimeLinewidget extends StatelessWidget {
  const TimeLinewidget({super.key, required this.isfirst, required this.islast, required this.isPast,  this.child});
  final bool isfirst;
  final bool islast;
  final bool isPast;
  final child;
  

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 65,
      child: TimelineTile(
        isFirst: isfirst,
        isLast: islast,
        
         beforeLineStyle: LineStyle(
          color:isPast? const Color(0xFF4257D3):const Color(0xFFD9D9D9) ,
          thickness: 1
         ),
         indicatorStyle: IndicatorStyle(
          height: 6,
          
          color:  const Color(0xFFD9D9D9),
          iconStyle: IconStyle(iconData: Icons.circle,color:isPast? const Color(0xFF4257D3):const Color(0xFFD9D9D9))
         ),
         endChild: child
      ),
    );
  }}