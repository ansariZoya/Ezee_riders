import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/enter_otp.dart';
import 'package:driver_app/screens/ride_cancel.dart';
import 'package:driver_app/widgets/time_line.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ArrivedTrip extends StatefulWidget {
  const ArrivedTrip({super.key});

  @override
  State<ArrivedTrip> createState() => _ArrivedTripState();
}

class _ArrivedTripState extends State<ArrivedTrip> {

  void _showDialogebox(){
    showDialog(context: context, builder: (BuildContext context){
      return Builder(builder: (context){
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius:BorderRadius.all(Radius.circular(12))
          ),
          
            content: SizedBox(
              height: 249,width: 400,
             
              child: Column(
                children: [
                  Image.asset("assets/images/red.png"),
                  const SizedBox(height: 10,),
                  Text("Do you wanna cancel pickup?",style: AppTextStyles.headline3),
                  const SizedBox(height: 10,),
                  Text("You cannot undo this action!",style: AppTextStyles.smalltitle,),
                  const SizedBox(height: 10,),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text:" 9",style: AppTextStyles.smalltitle.copyWith(color: const Color(0xFFE57356))
                      ),
                      TextSpan(text:"/10 cancellation left ",style: AppTextStyles.smalltitle)
                    ]
                  )),
                   const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 42,width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[200],
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child:  const Text(
                              'No',
                              style: AppTextStyles.baseStyle2 ,
                            )),
                      ),
                      SizedBox(height: 42,width: 100,
                        child: ElevatedButton(
                            style:
                             ElevatedButton.styleFrom(
                              backgroundColor: 
                                const Color(0xFFE75356),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                            ),
                            onPressed: () {
                             
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const RideCancel()));
                            },
                            child:  const Text(
                              'Yes',
                              style: AppTextStyles.baseStyle2,
                            )),
                      )
                    ],
                                     )
                   
                ],
              ),
              
            ),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
   

    return 
    Scaffold(
      body:  Padding(
      padding: const EdgeInsets.only(top: 340),
      child: Container(
         
          
          color: const Color(0xFFFFFFFF),
          child: Column(
            children: [
               ListTile(
                leading: Container(
                  height: 36,width: 36,
                   decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD9D9D9),
                ),
                  child: const Icon(
                          Icons.phone,
                          color: Color(0xFF4257D3),
                        ),
                ),
                      title: const Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Text(
                        "0 min away",
                        style: AppTextStyles.baseStyle,
                                            ),
                      ),trailing: Container(height: 36,width: 36,
                        decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD9D9D9),
                ),
                        child: const Icon(
                          Icons.message,
                          color: Color(0xFF4257D3),
                        ),
                      ),
          
              ),
               SizedBox(
          width: 298,height: 42,
           child: Padding(
             padding:  const EdgeInsets.only(left: 24,right: 24),
             child: SlideAction(
              onSubmit: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnterOtP()));
                return null;
              },
              outerColor: const Color(0xFF3BD286),
              
              sliderButtonIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 5, bottom: 5),
                          child: Container(
                            height: 30,
                            width: 30,
                           
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFFFFF),
                            ),
                            child: const Icon(Icons.two_wheeler,
                                color: Color(0xFF52D567)),
                          ),
                        ),
              sliderButtonIconPadding: 2,
               borderRadius: 24,
             
               
               text: "Arrived",
               textStyle: AppTextStyles.smalltitle.copyWith(color:const Color(0xFFFFFFFF))
               
             
             ),
           ),),
              ListTile(
                leading: Image.asset('assets/images/arrive.png'),
                      title: const Text("Ganesh Mahanta",style: AppTextStyles.baseStyle,),
                     trailing:  Container(height: 17,width: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xFFFFFFFF),
                    ),child: Row(children: [Text("4.4",style: AppTextStyles.subtitle,),
                                 const Icon(Icons.star,color: Color(0xFFFFD600,),size: 6,)
                    ],),)
          
              ),
             
           TimeLinewidget(isfirst: true, islast: false, isPast: true,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 8,top: 10),
                   child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "Pickup at 2km away",
                                        style: AppTextStyles.baseStyle
                                            .copyWith(fontSize: 13.28)),
                                    TextSpan(
                                        text:
                                            "\nDr. Rahalkar Hospital, Masanganj, Chhattisgarh \n 495001",
                                        style: AppTextStyles.smalltitle),
                         
                                        
                                        
                                  ])),
                 ),
                 ),
                 
                  TimeLinewidget(isfirst: false, islast: true, isPast: false,child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 5),
                    child: Text(" \n \n Drop Off 8km ",
                                    style: AppTextStyles.baseStyle
                                        .copyWith(fontSize: 13.28)),
                  ),),
              TextButton(onPressed: () {  
                         _showDialogebox();
              }, child: Text("Cancel ride",style: AppTextStyles.headline3.copyWith(fontWeight: FontWeight.w400)),),
                  const SizedBox(height: 5,),
                   SizedBox(
                  width: 298,
                  height: 42,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE75356),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ArrivedTrip()));
                      },
                      child: Text(
                        "SOS",
                        style: AppTextStyles.smalltitle
                            .copyWith(color: const Color(0xFFFFFFFF)),
                      )),
                )
                  
            ],
          )),
    )
    );
    
   
  }
}
