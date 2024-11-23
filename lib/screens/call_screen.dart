

import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back_ios)),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Expanded(
           child: Column(
             children: [
               Image.asset("assets/images/Ganesh.png"),
                Text("Ganesh Mahanta",style: AppTextStyles.headline3.copyWith(color: const Color(0xFF000000)),)
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(68.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.volume_up,color:Color(0xFF1C1B1F),)),
            Container(
              height: 60, width: 60,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFE75356)
            ),child: IconButton(onPressed: (){}, icon: const Icon(Icons.call_end,color: Color(0xFFFFFFFF),)),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.mic,color: Color(0xFF1C1B1F),))
           ],),
         )
        
      ],
    ),);
  }
}