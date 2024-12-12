
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.icon, required this.text, required this.trailing, });
 final Widget icon;
 final String text;
 final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: AppColors.greytextColor,
     visualDensity: const VisualDensity(vertical: -2),
     leading: Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.newColor),
                      child: icon,), 
     title: Text(
                    text,
                    style: AppTextStyles.baseStyle,
                  ),
                  trailing: trailing,
                  
  
    );
  }
}