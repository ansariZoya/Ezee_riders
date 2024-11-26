import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/widgets/select_option.dart';
import 'package:flutter/material.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  void _selectOption(BuildContext context){
    showBottomSheet(context: context,
     shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight:  Radius.circular(12),
          )
        ),
     builder: (context){
      return const SelectOptionPage();
     });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 374,
      color: const Color(0xfffffffff),
      child: Padding(
        padding: const EdgeInsets.only(left: 13,top: 13),
        child: Column(
          children: [
            const Center(
              child: SizedBox(
                height: 3.5,
                width: 40,
                child: Divider(
                  thickness: 2,
                  endIndent: 2,
                  indent: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  "Payout details: (16 Sep - 22 Sep)",
                  style: AppTextStyles.baseStyle2.copyWith(
                    color: const Color(0xFF221E22),
                  ),
                ),
              ),
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              title: Text(
                "Earnings",
                style: AppTextStyles.baseStyle2
                    .copyWith(color: const Color(0xFF818587),
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                "₹470.57",
                style: AppTextStyles.baseStyle2
                    .copyWith(color: const Color(0xFF221E22),
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
               visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                "Cash in hand",
                style: AppTextStyles.baseStyle2
                    .copyWith(color: const Color(0xFF818587),
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                "₹340.42",
                style: AppTextStyles.baseStyle2
                    .copyWith(color: const Color(0xFFE75356),
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                "Deductions",
                style: AppTextStyles.baseStyle2
                    .copyWith(color: const Color(0xFF818587),
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                "₹0",
                style: AppTextStyles.baseStyle2
                    .copyWith(color: const Color(0xFFE75356),
                    fontWeight: FontWeight.w500),
              ),
            ), ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                "Amount withdrawn",
                style: AppTextStyles.baseStyle2
                    .copyWith(color: const Color(0xFF818587),
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                "₹0",
                style: AppTextStyles.baseStyle2
                    .copyWith(color: const Color(0xFFE75356),
                    fontWeight: FontWeight.w500),
              ),
            ),
            
            ListTile(
              visualDensity: const VisualDensity(vertical: -4,),
              title: Text(
                "Payout balance",
                style: AppTextStyles.baseStyle2.copyWith(
                    color: const Color(0xFF221E22),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                "₹62.80",
                style: AppTextStyles.baseStyle2.copyWith(
                    color: const Color(0xFF221E22),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(
                left: 18,right: 30
               ),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Min. balance required "
                      "\nThis amount will be adjusted with \nthe weekly payout",
                      style: AppTextStyles.baseStyle2.copyWith(
                          color: const Color(0xFF818587),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "₹300",
                      style: AppTextStyles.baseStyle2.copyWith(
                          color: const Color(0xFF818587),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
             ),
                ListTile(
              visualDensity: const VisualDensity(vertical: -4,),
              title: Text(
                "Withdrawable amount ",
                style: AppTextStyles.baseStyle2.copyWith(
                    color: const Color(0xFF221E22),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                "₹0",
                style: AppTextStyles.baseStyle2.copyWith(
                    color: const Color(0xFF221E22),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 320, height: 38,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF818587),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                onPressed: (){
                  _selectOption(context);
                }, child: Text("Withdraw",
              style: AppTextStyles.baseStyle2.copyWith(
                color: const Color(0xfffffffff),
                fontSize: 14,

              ),)),
            )
          ],
        ),
      ),
    );
  }
}
