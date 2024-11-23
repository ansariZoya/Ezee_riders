import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
class TabBarRow extends StatelessWidget {
  const TabBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
              FilterChipWidget(label: 'Daily', isSelected: false,),
              FilterChipWidget(label: 'Weekly', isSelected: true,),
              FilterChipWidget(label: 'Monthly', isSelected: false,),
        
          ],
        
        ),
          TextButton.icon(onPressed: (){},
          icon: Icon(Icons.filter_alt_outlined,color: Color(0xFF4257D3),),
           label: const Text("Filter"))
      ],
    );
  }
}
class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({super.key, required this.label, required this.isSelected});
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
    child: Chip(label: Text(label,style: AppTextStyles.headline3.copyWith(
      fontSize: 13.28,
      color:  isSelected? Color(0xFF0056F6) : Color(0xFF221E22)),)),
    );
  }
}