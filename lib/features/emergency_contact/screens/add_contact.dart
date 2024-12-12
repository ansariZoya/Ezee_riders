import 'package:driver_app/features/emergency_contact/screens/add_more.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
   final List<Map<String,String>>_contacts = [
    {'name': 'Mr. Roy', 'phone': '+91 1234567890'},
    {'name': 'Mr. Roy', 'phone': '+91 1234567890'},
    {'name': 'Mr. Roy', 'phone': '+91 1234567890'},
    {'name': 'Mr. Roy', 'phone': '+91 1234567890'},
    {'name': 'Mr. Roy', 'phone': '+91 1234567890'},
    {'name': 'Mr. Roy', 'phone': '+91 1234567890'},
    {'name': 'Mr. Roy', 'phone': '+91 1234567890'},
    {'name': 'Mr. Roy', 'phone': '+91 1234567890'},

   ];

  List<Map<String,String>> _filteredContacts = []; //forsearch button
  final Set<int> _selectedContacts = {};
  final int _maxContacts = 2;
  @override
  void initState() {
   _filteredContacts = _contacts;
    super.initState();
  }
 
 void _filterContacts( String query){
  setState(() {
    _filteredContacts = _contacts
    .where((contact)=> 
       contact['name']!.toLowerCase().contains(query.toLowerCase())||
       contact['phone']!.contains(query)
    ).toList();
  });
 }
 void _toggleSelection(int index){
  setState(() {
    if(_selectedContacts.contains(index)){
      _selectedContacts.remove(index);
    }else if (_selectedContacts.length < _maxContacts){
      _selectedContacts.add(index);
    }
  });
 }

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
            title: Text(
                    "Emergency contact",
                    style: AppTextStyles.baseStyle
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18.72),
                  ),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: ResponsiveSize.height(context, 42),
              width: ResponsiveSize.width(context, 316),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: AppColors.newColor
              ),
              child: TextField(
                onChanged: _filterContacts,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search,size: 17.19,color: AppColors.greytextColor,),
                  hintText: "Search",
                  hintStyle: AppTextStyles.baseStyle2.copyWith(fontWeight: FontWeight.w400,color:AppColors.greytextColor )
                ),
              ),
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("You can only add 4 emergency contact",style: AppTextStyles.baseStyle2.copyWith(fontWeight: FontWeight.w400,color:AppColors.greytextColor ,
              fontSize: 14),),
            ),
          ),SizedBox(height: ResponsiveSize.height(context,20),),
          Expanded(child: ListView.builder(
          itemCount: _filteredContacts.length,
        
          itemBuilder:(context,index){
            final contact = _filteredContacts[index];
            final isselected = _selectedContacts.contains(index);
            return ListTile(
             leading: CircleAvatar(
              backgroundColor: AppColors.secondaryColor,
              child: Text(contact['name']![0],style: AppTextStyles.baseStyle2.copyWith(
                color: AppColors.newtextColor,
                ),),
             ),
             title: Text(contact['name']!,style: AppTextStyles.baseStyle2.copyWith(
                color: AppColors.newtextColor,
                fontWeight: FontWeight.w600
                ),),
             subtitle: Text(contact['phone']!,style: AppTextStyles.baseStyle2.copyWith(
                color: AppColors.greytextColor,
                fontWeight: FontWeight.w400,fontSize: 12
                )),
           trailing:   GestureDetector(
  onTap: () {
    _toggleSelection(index); // Toggle selection
  },
  child: Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isselected ? AppColors.primaryColor: AppColors.secondaryColor,
    ),
  ),
),
             onTap:(){
                   _toggleSelection(index);
             }

            );
          })),
          Container(
            height: ResponsiveSize.height(context, 48),
            width: ResponsiveSize.width(context, 330),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8)
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor
              ),
              onPressed: (){
                final selectedContacts = _selectedContacts
                    .map((index) => _filteredContacts[index])
                    .toList();
               Navigator.push(context, MaterialPageRoute(builder: 
               (context)=> AddMore(selectedContacts: selectedContacts,)));
            }, child: const Text("Add",style: AppTextStyles.baseStyle2,)),
          )
        ],
      )
    );
  }
}