import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';

class PayoutDetails extends StatefulWidget {
  const PayoutDetails({super.key});

  @override
  State<PayoutDetails> createState() => _PayoutDetailsState();
}

class _PayoutDetailsState extends State<PayoutDetails> {
  var items = [
    "sep17",
  ];
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
          "Payout Details",
          style: AppTextStyles.baseStyle.copyWith(fontSize: 18.72),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 360,
            height: 32,
            color: const Color(0xFFD9D9D9),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "16 sep to 22 sep",
                        style: AppTextStyles.baseStyle
                            .copyWith(color: const Color(0xFF4257D3), fontSize: 10.72),
                      ),
                      DropdownButton(
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: null,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFF4257D3),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "All Trips",
                        style: AppTextStyles.baseStyle
                            .copyWith(color: const Color(0xFF4257D3), fontSize: 10.72),
                      ),
                           DropdownButton(
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: null,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFF4257D3),
                          ))
                    
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 340,height: 40,
              color: const Color(0xFFD9D9D9),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                            "Sat, 18 Sep",
                            style: AppTextStyles.baseStyle
                                .copyWith(color: const Color(0xFF4257D3), fontSize: 13.28),
                          ),
              ),
            ),
          ),
           ListTile(
          
                          leading: Container(
                            height: 28,width: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF4257D3)
                            ),
                            child: const Icon(Icons.two_wheeler,color: Color(0xFFFFFFFF),)),
                          title: const Text("Ride to Cafe",style: AppTextStyles.baseStyle,),
                          subtitle: Text("1:09",style: AppTextStyles.smalltitle.copyWith(fontSize: 10.72),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("₹80",style: AppTextStyles.baseStyle.copyWith(fontSize: 13.28),),
                              const SizedBox(width: 8,),
                              Transform.rotate(angle: 110,
                              child: const Icon(Icons.arrow_outward,size: 10.33,color: Color(0xFF24A665),))
                            ],
                          ),
                        ),
                        ListTile(
          
                          leading: Container(
                            height: 28,width: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF24A665)
                            ),
                            child: const Icon(Icons.payments,color: Color(0xFFFFFFFF),)),
                          title: const Text("Withdrawn",style: AppTextStyles.baseStyle,),
                          subtitle: Text("Bank account ending with **** 1234\n1:09",style: AppTextStyles.smalltitle.copyWith(fontSize: 10.72),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("₹350",style: AppTextStyles.baseStyle.copyWith(fontSize: 13.28),),
                              const SizedBox(width: 8,),
                              const Icon(Icons.arrow_outward,size: 10.33,color: Color(0xFFE75356),)
                            ],
                          ),
                        ),  ListTile(
          
                          leading: Container(
                            height: 28,width: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF4257D3)
                            ),
                            child: const Icon(Icons.two_wheeler,color: Color(0xFFFFFFFF),)),
                          title: const Text("Ride to Cafe",style: AppTextStyles.baseStyle,),
                          subtitle: Text("1:09",style: AppTextStyles.smalltitle.copyWith(fontSize: 10.72),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("₹80",style: AppTextStyles.baseStyle.copyWith(fontSize: 13.28),),
                              const SizedBox(width: 8,),
                              Transform.rotate(angle: 110,
                              child: const Icon(Icons.arrow_outward,size: 10.33,color: Color(0xFF24A665),))
                            ],
                          ),
                        ),  ListTile(
          
                          leading: Container(
                            height: 28,width: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF4257D3)
                            ),
                            child: const Icon(Icons.two_wheeler,color: Color(0xFFFFFFFF),)),
                          title: const Text("Ride to Cafe",style: AppTextStyles.baseStyle,),
                          subtitle: Text("1:09",style: AppTextStyles.smalltitle.copyWith(fontSize: 10.72),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("₹80",style: AppTextStyles.baseStyle.copyWith(fontSize: 13.28),),
                              const SizedBox(width: 8,),
                              Transform.rotate(angle: 110,
                              child: const Icon(Icons.arrow_outward,size: 10.33,color: Color(0xFF24A665),))
                            ],
                          ),
                        ),  ListTile(
          
                          leading: Container(
                            height: 28,width: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF24A665)
                            ),
                            child: const Icon(Icons.payments,color: Color(0xFFFFFFFF),)),
                          title: const Text("Withdrawn",style: AppTextStyles.baseStyle,),
                          subtitle: Text("Bank account ending with **** 1234\n1:09",style: AppTextStyles.smalltitle.copyWith(fontSize: 10.72),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("₹350",style: AppTextStyles.baseStyle.copyWith(fontSize: 13.28),),
                              const SizedBox(width: 8,),
                              const Icon(Icons.arrow_outward,size: 10.33,color: Color(0xFFE75356),)
                            ],
                          ),
                        ), ListTile(
          
                          leading: Container(
                            height: 28,width: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFE75356)
                            ),
                            child: const Icon(Icons.currency_rupee,color: Color(0xFFFFFFFF),)),
                          title: const Text("Cash in Hand",style: AppTextStyles.baseStyle,),
                          subtitle: Text("1:09",style: AppTextStyles.smalltitle.copyWith(fontSize: 10.72),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("₹80",style: AppTextStyles.baseStyle.copyWith(fontSize: 13.28),),
                              const SizedBox(width: 8,),
                              Transform.rotate(angle: 110,
                              child: const Icon(Icons.arrow_outward,size: 10.33,color: Color(0xFF24A665),))
                            ],
                          ),
                        ),  
          
        ],
      ),
    );
  }
}
