

import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class PaymentTrip extends StatefulWidget{
  const PaymentTrip({super.key});

  @override
  State<PaymentTrip> createState() => _PaymentTrip();

}
class _PaymentTrip extends State<PaymentTrip>{
  int withdraw=0;
  bool info=false;
  @override
  void initState() {
    super.initState();
    Waiting();
  }
  void Waiting() async{
    await withdrawfetchUser("0123456789");
    await withdrawinsertUser("0123456789");
    await addFieldtoUser("0123456789");
  }
  Future<void> withdrawfetchUser(String phonenumber) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/withdrawfindUser/$phonenumber'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      withdraw = data['balance'];
      setState(() {
        info=true;
      });

    } else if (response.statusCode == 404) {
      print('User not found');
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
  Future<void> withdrawinsertUser(String phoneNumber) async {
    if (!info) {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/withdrawinsertUser'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'phonenumber': phoneNumber,

          'balance': 0
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data['message']);
      } else {
        throw Exception('Failed to insert user');
      }
    }
  }
  Future<void> addFieldtoUser(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/addFieldToUser'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phonenumber': phoneNumber,
        'userData' : {
          'balance':withdraw + 80
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['message']);
    } else {
      throw Exception('Failed to insert user');
    }
  }
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