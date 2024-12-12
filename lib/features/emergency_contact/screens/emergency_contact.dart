import 'package:driver_app/features/emergency_contact/screens/add_contact.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

class EmergencyContact extends StatelessWidget {
  const EmergencyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: SizedBox(
              height: ResponsiveSize.height(context, 107),
              width: ResponsiveSize.width(context, 320),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                 Text(
                    "Emergency contact",
                    style: AppTextStyles.baseStyle
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18.72),
                  ),SizedBox(height: ResponsiveSize.height(context, 4),),
                  Text(
                      "Keep your freinds and family in your "
                      "\n emergency contact",
                      style: AppTextStyles.smalltitle),
                  ListTile(
                    leading: const Icon(
                      Icons.add,
                      size: 23,
                    ),
                    title: Text(
                      "Add emergency contact",
                      style: AppTextStyles.baseStyle2
                          .copyWith(color: AppColors.newtextColor),
                    ),
                    trailing: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: 
                        (context)=> const AddContact()));
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 11,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveSize.height(context, 59),
            width: ResponsiveSize.width(context, 320),
            child: ListTile(
                title: Text("Mr Roy",
                    style: AppTextStyles.baseStyle2
                         .copyWith(color: AppColors.newtextColor)),
                subtitle: Text("+91 1234567890 ",style: AppTextStyles.baseStyle2.copyWith(
                  fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.greytextColor
                ),), 
                  trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 11,
                    ),       
                        
                        ),
          )
        ],
      ),
    );
  }
}
