
import 'package:driver_app/features/payout/screens/payout_done.dart';

import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WithdrawCash extends StatefulWidget {
  const WithdrawCash({super.key});

  @override
  State<WithdrawCash> createState() => _WithdrawCashState();
}

class _WithdrawCashState extends State<WithdrawCash> {
  String inputAmount = "";
  int withdraw=0;
  @override
  void initState() {
    super.initState();
    Waiting();
  }
  void Waiting() async{
    await withdrawfetchUser("0123456789");

  }
  Future<void> withdrawfetchUser(String phonenumber) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/withdrawfindUser/$phonenumber'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      withdraw = data['balance'];
      print(withdraw);
    } else if (response.statusCode == 404) {
      print('User not found');
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
  void numberPressed(String value) {
    setState(() {
      if (value == "back") {
        if (inputAmount.isNotEmpty) {
          inputAmount = inputAmount.substring(0, inputAmount.length - 1);
        }
      } else {
        inputAmount += value;
      }
    });
  }
  String getIndianTimestamp() {

    DateTime utcTime = DateTime.now().toUtc();


    DateTime indianTime = utcTime.add(Duration(hours: 5, minutes: 30));


    return indianTime.toIso8601String();
  }
  Future<void> addFieldtoUser(String phoneNumber) async {
    if (int.parse(inputAmount) < withdraw) {
      String timestamp = getIndianTimestamp();
      print(timestamp);
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/addFieldToUser'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'phonenumber': phoneNumber,
          'userData': {
            'request': int.parse(inputAmount),
            'createdAt':timestamp,
            'updatedAt':""
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
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
          ),
        ),
        title: Text(
          "Withdraw",
          style: AppTextStyles.baseStyle.copyWith(fontSize: 18.72),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.width(context, 13)),
            child: Text(
              "₹300 available",
              style: AppTextStyles.smalltitle.copyWith(color: const Color(0xFF221E22)),
            ),
          ),
          SizedBox(height: ResponsiveSize.height(context, 40)),
          Expanded(
            child: Text(
              "₹${inputAmount.isEmpty ? '0' : inputAmount}",
              style: AppTextStyles.baseStyle.copyWith(
                fontSize: 32,
                color: inputAmount.isEmpty ? AppColors.secondaryColor : AppColors.blacktextColor,
              ),
            ),
          ),
          Container(
            width: ResponsiveSize.width(context, 360),
            height: ResponsiveSize.height(context, 47),
            color: AppColors.messageColor,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: ResponsiveSize.height(context, 10),
              ),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                leading: Container(
                  height: ResponsiveSize.height(context, 32),
                  width: ResponsiveSize.width(context, 32),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset("assets/images/account_balance.png"),
                ),
                iconColor: AppColors.primaryColor,
                title: Text(
                  "BANK OF INDIA",
                  style: AppTextStyles.baseStyle.copyWith(fontSize: 13.28, fontWeight: FontWeight.w600),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: ResponsiveSize.height(context, 2)),
                  child: Text(
                    "XXXX 1234",
                    style: AppTextStyles.subtitle.copyWith(fontSize: 8),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: AppColors.backgroundColor,
            width: ResponsiveSize.width(context, 329),
            height: ResponsiveSize.height(context, 200),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return Center(
                    child: Text(
                      ".",
                      style: AppTextStyles.baseStyle.copyWith(fontSize: 30),
                    ),
                  );
                }
                if (index == 11) {
                  return IconButton(
                    onPressed: () => numberPressed("back"),
                    icon: Image.asset(
                      'assets/images/fill.png',
                      height: ResponsiveSize.height(context, 24),
                      width: ResponsiveSize.width(context, 18),
                    ),
                  );
                }
                final value = index == 10 ? "0" : "${index + 1}";
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0, 
                    backgroundColor: Colors.transparent, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ResponsiveSize.width(context, 8)), 
                    ),
                  ),
                  onPressed: () => numberPressed(value),
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: AppColors.newtextColor,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ResponsiveSize.height(context, 20)),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PayoutDone()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ResponsiveSize.width(context, 8)),
                ),
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(ResponsiveSize.width(context, 320), ResponsiveSize.height(context, 48)),
              ),
              child: const Text(
                "Cash Out",
                style: TextStyle(fontSize: 18, color: AppColors.backgroundColor),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
