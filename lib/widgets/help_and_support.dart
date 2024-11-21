
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 261,width: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Help and Support",style: AppTextStyles.headline,),
            const SizedBox(height: 10,),
            Container(
              height: 89,width: 323,
              color: const Color(0xFFF4F4F4),
              child: ListTile(
                leading: const Icon(Icons.help,color: Color(0xFF1C1B1F),),
                title: const Text("Get your queries resolved",style: AppTextStyles.baseStyle,),
                subtitle: Text("Call or chat with us at anytime and get your issues resolve instantly.",style: AppTextStyles.subtitle,),
              ),
            ),
             Container(
              height: 89,width: 323,
              color: const Color(0xFFF4F4F4),
              child: ListTile(
                leading: const Icon(Icons.info,color: Color(0xFF1C1B1F),),
                title: const Text("Setup your emergency contact ",style: AppTextStyles.baseStyle,),
                subtitle: Text("we’ll contact them if an issue is reported and you don’t respond.",style: AppTextStyles.subtitle,),
              ),
            )
          ],
        ),
      ),
    );
  }
}