import 'package:driver_app/features/more/widgets/custom_list_tile.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  var _isSwitched = false;
    var _isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: ResponsiveSize.height(context, 126),
              width: ResponsiveSize.width(context, 340),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  border: Border.all(
                    width: ResponsiveSize.width(context, 1),
                    color: AppColors.boxColor,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                    color: AppColors.purplebackground,
                    height: ResponsiveSize.height(context, 72),
              width: ResponsiveSize.width(context, 340),
                    child: ListTile(
                      textColor: AppColors.newgreyColor,
                      leading: Image.asset('assets/images/Ganesh.png'),
                      title: const Text(
                        "Ganesh Mahanta",
                        style: AppTextStyles.baseStyle,
                      ),
                      subtitle: Text(
                        "ER1234958",
                        style: AppTextStyles.subtitle,
                      ),
                      trailing: Container(
                        height: ResponsiveSize.height(context, 17),
                        width: ResponsiveSize.width(context, 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.backgroundColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4.4",
                              style: AppTextStyles.subtitle,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFFD600),
                              size: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveSize.height(context, 11),
                      vertical: ResponsiveSize.height(context, 12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.ad_units,
                              size: 12,
                              color: Color(0xFF818587),
                            ),
                            const SizedBox(width: 5),
                            RichText(
                              text: TextSpan(
                                style: AppTextStyles.subtitle,
                                children: [
                                  TextSpan(
                                    text: "Phone:",
                                    style: AppTextStyles.smalltitle
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  const TextSpan(text: " 123456 7890"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 12,
                              color: Color(0xFF818587),
                            ),
                            const SizedBox(width: 5),
                            RichText(
                              text: TextSpan(
                                style: AppTextStyles.smalltitle,
                                children: [
                                  TextSpan(
                                    text: "Zone: ",
                                    style: AppTextStyles.smalltitle
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  const TextSpan(text: "Zone: Raipur"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveSize.height(context, 12),
          ),
          Container(
            height: ResponsiveSize.height(context, 552),
            width: ResponsiveSize.width(context, 340),
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                border: Border.all(
                  width: ResponsiveSize.width(context, 1),
                  color: AppColors.boxColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                CustomListTile(
                  icon: const Icon(Icons.abc),
                  text: "Auto accept",
                  trailing: Switch(
                    activeColor: AppColors.primaryColor
                    ,
                    value: _isSwitched2,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched2 = value;
                      });
                    },
                  ),
                ),
                CustomListTile(
                  icon: const Icon(Icons.merge),
                  text: "My Route Booking",
                  trailing: Switch(
                    activeColor: AppColors.primaryColor,
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                  ),
                ),
                const CustomListTile(
                    icon: Icon(Icons.account_circle_outlined),
                    text: "Manage profile",
                    trailing: SizedBox(
                      height: 10,width: 6.17,
                      child: Icon(Icons.arrow_forward_ios,size: 10,))),
                const CustomListTile(
                    icon: Icon(Icons.sports),
                    text: "Trip Activity",
                    trailing: SizedBox(
                      height: 10,width: 6.17,
                      child: Icon(Icons.arrow_forward_ios,size: 10))),
                const CustomListTile(
                    icon: Icon(Icons.contact_page_outlined),
                    text: "Documents",
                    trailing: SizedBox(
                      height: 10,width: 6.17,
                      child: Icon(Icons.arrow_forward_ios,size: 10))),
                const CustomListTile(
                    icon: Icon(Icons.two_wheeler_outlined),
                    text: "Vehicles",
                    trailing: SizedBox(
                      height: 10,width: 6.17,
                      child: Icon(Icons.arrow_forward_ios,size: 10))),
                const CustomListTile(
                    icon: Icon(Icons.percent),
                    text: "Offers",
                    trailing: SizedBox(
                      height: 10,width: 6.17,
                      child: Icon(Icons.arrow_forward_ios,size: 10))),
                const CustomListTile(
                    icon: Icon(Icons.assured_workload_outlined),
                    text: "Bank details",
                    trailing: SizedBox(
                      height: 10,width: 6.17,
                      child: Icon(Icons.arrow_forward_ios,size: 10))),
                const CustomListTile(
                    icon: Icon(Icons.image),
                    text: "Videos for you",
                    trailing: SizedBox(
                      height: 10,width: 6.17,
                      child: Icon(Icons.arrow_forward_ios,size: 10))),
                ListTile(
                  iconColor: AppColors.secondaryColor,
                  leading: Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.newColor),
                      child: const Icon(Icons.sos)),
                  title: const Text(
                    "Emergency Contact",
                    style: AppTextStyles.baseStyle,
                  ),
                ),
                SizedBox(height: ResponsiveSize.height(context, 10),),
                 ListTile(
                  
                  iconColor: AppColors.redColor,
              
                  leading: Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.newColor),
                      child: const Icon(Icons.logout)),
                  title: const Text(
                    "Log out",
                    style: AppTextStyles.baseStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
