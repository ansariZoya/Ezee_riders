import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/payout_done.dart';
import 'package:flutter/material.dart';

class WithdrawCash extends StatefulWidget {
  const WithdrawCash({super.key});

  @override
  State<WithdrawCash> createState() => _WithdrawCashState();
}

class _WithdrawCashState extends State<WithdrawCash> {
  String inputAmount = "";
  void numberPressed(String value) {
    setState(() {
      if (value == "back") {
        if (value.isNotEmpty) {
          inputAmount = inputAmount.substring(0, inputAmount.length - 1);
        }
      } else {
        inputAmount += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const SizedBox(
                height: 11.31,
                width: 6.71,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF1C1B1F),
                ))),
        title: Text(
          "Withdraw",
          style: AppTextStyles.baseStyle.copyWith(fontSize: 18.72),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Text(
                "₹300 available",
                style: AppTextStyles.smalltitle
                    .copyWith(color: const Color(0xFF221E22)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Text(
                "₹${inputAmount.isEmpty ? '0' : inputAmount}",
                style: AppTextStyles.baseStyle.copyWith(
                  fontSize: 32,
                  color: inputAmount.isEmpty
                      ? const Color(0xFFD9D9D9)
                      : const Color(0xFF221E22),
                ),
              ),
            ),
            Container(
              
              width: 360,
              color: const Color(0xFFF7F9FF),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                leading: Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(
                      Icons.account_balance,
                      size: 18,
                    )),
                iconColor: const Color(0xFF4257D3),
                title: Text("BANK OF INDIA",style: AppTextStyles.baseStyle.copyWith(
                  fontSize: 13.28
                ),),
                subtitle: 
                //Add Roboto font here ..i do not have roboto
                Text("XXXX 1234",style:AppTextStyles.subtitle.copyWith(fontSize: 8)),
              ),
            ),
            Container(
              color: const Color(0xfffffffff),
              width: 329,
              height: 205,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    if (index == 9) {
                      return const SizedBox();
                    }
                    if (index == 11) {
                      return IconButton(
                          onPressed: () => numberPressed("back"),
                          icon: const Icon(Icons.close_outlined));
                    }
                    final value = index == 10 ? "0" : "${index + 1}";
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero)),
                          backgroundColor: const Color(0xFFFFFFFF),
                        ),
                        onPressed: () => numberPressed(value),
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000)),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> const PayoutDone()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color(0xFF4257D3),
                  minimumSize: const Size(320, 48),
                ),
                child: const Text(
                  "Cash Out",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
