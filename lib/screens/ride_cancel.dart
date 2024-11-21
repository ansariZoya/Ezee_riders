import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';
class RideCancel extends StatefulWidget {
  const RideCancel({super.key});

  @override
  State<RideCancel> createState() => _RideCancelState();
}

class _RideCancelState extends State<RideCancel> {
  String? selectedReason;
  final List<String> reasons = [
    "Customer is not picking up the call",
    "Can’t find the customer",
    "Waiting time is too much",
    "Misbehaved ",
    "Other",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 400),
        child: Container(
          height: 500,width: 360,
          color:const Color(0xFFFFFFFF),
          child: Column(children: [
             Padding(
               padding: const EdgeInsets.only(left: 12,top: 12),
               child: Text("Share the reason for cancelling the pickup",style: AppTextStyles.baseStyle.copyWith(fontSize: 20),),
             ),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                 itemCount: reasons.length,
                itemBuilder: (context, index) {
                return GestureDetector(
                  
                   onTap: (){
                    setState(() {
                      selectedReason=reasons[index];
                    });
                  
                      
                   },child: Padding(
                    padding: const EdgeInsets.only(left: 24,right: 24,bottom: 2,top: 2),
                     child: Container(
                      height: 40,width: 328,
                      
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:selectedReason == reasons[index]
                          ? Colors.green: Colors.grey,
                        
                        ),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(reasons[index],
                            style: AppTextStyles.baseStyle.copyWith(color: const Color(0xFF818587)),),
                          ),
                        ],
                      ),
                     ),
                   ),
                   );
                   
              
                
              },),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SizedBox(
                width: 328,height: 40,
                
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4257D3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))
                  ),
                  onPressed: (){
                  if(selectedReason!=null){
                    print("selected reaason:$selectedReason");
                  }else{
                    return;
                  }
                  
                }, child: Text("Submit Feedback",style: AppTextStyles.baseStyle.copyWith(color: const Color(0xFFFFFFFF)),)),
              ),
            )
            
          ],),
        ),
      ),
    );
  }
}