import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';


class PaymentTrip extends StatelessWidget {
  const PaymentTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: ResponsiveSize.height(context, 250),
          left: ResponsiveSize.width(context, 17),
          right: ResponsiveSize.width(context, 17),
        
        ),
        child: Container(
          height: ResponsiveSize.height(context, 417),
          width: ResponsiveSize.width(context, 326),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                ResponsiveSize.width(context, 12)), 
            color: AppColors.backgroundColor,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                    top:   ResponsiveSize.height(context, 20),
                    ),
                    child: Text(
                      "₹80.00",
                      style: AppTextStyles.baseStyle
                          .copyWith(fontSize: ResponsiveSize.height(context, 32)),
                    ),
                  ),
                  Text(
                    "Cash to collect",
                    style: AppTextStyles.smalltitle,
                  ),
                ],
              ),SizedBox(height: ResponsiveSize.height(context, 15),),
              // Details Section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.width(context, 20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          style: AppTextStyles.smalltitle,
                        ),
                        Text(
                          "₹100.00",
                          style: AppTextStyles.smalltitle.copyWith(color: AppColors.blackColor),
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveSize.height(context, 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: AppTextStyles.smalltitle,
                        ),
                        Text(
                          "₹00",
                          style: AppTextStyles.smalltitle.copyWith(color: AppColors.blackColor),
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveSize.height(context, 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wallet",
                          style: AppTextStyles.smalltitle
                        ),
                        Text(
                          "₹80.00",
                          style: AppTextStyles.smalltitle.copyWith(color: AppColors.blackColor)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: ResponsiveSize.height(context, 20)),
              // Time and Distance Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Time",
                        style: AppTextStyles.subtitle,
                      ),
                      Text(
                        "15min",
                        style: AppTextStyles.subtitle
                            .copyWith(fontSize: ResponsiveSize.height(context, 16)),
                      ),
                    ],
                  ),
                  SizedBox(width: ResponsiveSize.width(context, 60)),
                  Column(
                    children: [
                      Text(
                        "Distance",
                        style: AppTextStyles.subtitle,
                      ),
                      Text(
                        "5.2 Km",
                        style: AppTextStyles.subtitle
                            .copyWith(fontSize: ResponsiveSize.height(context, 16)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: ResponsiveSize.height(context, 5)),
              // Rate Customer Section
              Text(
                "Rate your customer",
                style: AppTextStyles.subtitle
                    .copyWith(fontSize: ResponsiveSize.height(context, 16)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => SizedBox(
                    height: ResponsiveSize.height(context, 37.8),
                    width: ResponsiveSize.width(context, 39.26),
                    child: const Icon(
                      Icons.star,
                      color: Color(
                                0xFFFFD600,
                              ),
                      size: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: ResponsiveSize.height(context, 60)),
              // Bottom Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: ResponsiveSize.height(context, 46),
                  width: ResponsiveSize.width(context, 437),
                  decoration: const BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Get ready for next ride",
                      style: AppTextStyles.baseStyle2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
