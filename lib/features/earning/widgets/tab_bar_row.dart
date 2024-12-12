import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
class TabBarRow extends StatelessWidget {
  const TabBarRow({super.key, required this.selectedTab, required this.onTapSelectedTab});
  final String selectedTab;
  final Function onTapSelectedTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            children: [
                GestureDetector(
                  onTap:()=> onTapSelectedTab("Daily",),
                  child:  FilterChipWidget(text: 'Daily', isSelected:
                  selectedTab== "Daily"
                  ,)),
                GestureDetector(
                   onTap:()=>  onTapSelectedTab("Weekly"),
                  child:  FilterChipWidget(text: 'Weekly', isSelected: 
                  selectedTab== "Weekly",)),
                GestureDetector(
                   onTap:()=>  onTapSelectedTab("Monthly"),
                  child:  FilterChipWidget(text: 'Monthly', isSelected: 
                  selectedTab== "Monthly",)),
          
            ],
          
          ),
            Container(
             width: 75,
             height: 28,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(4)
              ),
              child: TextButton.icon(onPressed: (){},
              icon: const Icon(Icons.filter_alt_outlined,color: Color(0xFF4257D3,),size: 12.5,),
               label:  Text("Filter",style: AppTextStyles.baseStyle.copyWith(fontSize: 10.72,color: const Color(0xFF0056F6)),)),
            )
        ],
      ),
    );
  }
}
class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({super.key, required this.isSelected, required this.text});
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),
    child: Column(
      children: [
     
          
           Text(text,style: AppTextStyles.headline3.copyWith(
          fontSize: 13.28,fontWeight: FontWeight.w600,
          color:  isSelected? AppColors.primaryColor : AppColors.blacktextColor),),
            const SizedBox(height: 4), 
          if (isSelected)
            Container(
              width: 40,
              height: 2,
              color:AppColors.primaryColor
            ),
      ],
    ),
    );
  }
}