import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/features/payout/widgets/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/utils/responsive_size.dart'; // Import ResponsiveSize class

class PayOutScreen extends StatefulWidget {
  const PayOutScreen({super.key});

  @override
  State<PayOutScreen> createState() => _PayOutScreenState();
}

class _PayOutScreenState extends State<PayOutScreen> {
  void _showWithdrawPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
     
      builder: (context) {
        return const WithdrawPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(ResponsiveSize.width(context, 12)),
            child: Container(
              height: ResponsiveSize.height(context, 168),
              width: ResponsiveSize.width(context, 324),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,color: AppColors.newColor
                ),
                borderRadius: BorderRadius.circular(12),
                color: AppColors.backgroundColor
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: ResponsiveSize.height(context, 20),
                  left: ResponsiveSize.width(context, 18),
                  right: ResponsiveSize.width(context, 7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Balance",
                          style: AppTextStyles.baseStyle2.copyWith(
                            color: AppColors.blacktextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "₹ 300.00",
                          style: AppTextStyles.baseStyle2.copyWith(
                            color: AppColors.blacktextColor,
                            fontWeight: FontWeight.w600,
                            
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Available cash limit: ₹ 300.00",
                      style: AppTextStyles.baseStyle2.copyWith(
                        color: AppColors.blacktextColor,
                        fontSize: 10,fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: ResponsiveSize.height(context, 10)),
                    const Divider(
                      height: 1,
                      color: AppColors.greytextColor,
                    ),
                    SizedBox(height: ResponsiveSize.height(context, 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Withdrawable amount",
                          style: AppTextStyles.baseStyle2.copyWith(
                            color: const Color(0xFF221E22),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "₹ 300.00",
                          style: AppTextStyles.baseStyle2.copyWith(
                            color: AppColors.blacktextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveSize.height(context, 5)),
                    SizedBox(
                      width: ResponsiveSize.width(context, 90),
                      height: ResponsiveSize.height(context, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "View details",
                            style: AppTextStyles.baseStyle2.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.greenColor,
                              fontSize: 10,
                            ),
                          ),
                          Container(
                            width: ResponsiveSize.width(context, 13),
                            height: ResponsiveSize.height(context, 10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greenColor,
                            ),
                            child: const Icon(
                              Icons.arrow_right_alt,
                              size: 9,
                              color: AppColors.backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ResponsiveSize.height(context, 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: ResponsiveSize.width(context, 144),
                          height: ResponsiveSize.height(context, 34),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Deposit",
                              style: AppTextStyles.baseStyle2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.backgroundColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ResponsiveSize.width(context, 144),
                          height: ResponsiveSize.height(context, 34),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greytextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              _showWithdrawPage(context);
                            },
                            child: Text(
                              "Withdraw",
                              style: AppTextStyles.baseStyle2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: ResponsiveSize.height(context, 14)),
        ],
      ),
    );
  }
}
