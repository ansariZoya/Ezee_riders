
import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _controller = TextEditingController();
   List<Message> messages = [
    Message(text: 'Arrived Today', date: DateTime.now(), isSentbyme: true,),
     Message(text: 'Okay', date: DateTime.now(), isSentbyme: false,),
     

   ];
 
  
  @override
  Widget build(BuildContext context) {
     DateTime specificTime = DateTime(2024,11,21,10,36);
  String formattedtime = DateFormat('hh:mm a').format(specificTime);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios,color: Color(0xFF1C1B1F),)),
      title: const Text("Ganesh Mahanta",style: AppTextStyles.baseStyle,),
      ),
      body: Column(children: [ 
        Text("chat",style: AppTextStyles.smalltitle,) ,
        Expanded(
          child: GroupedListView<Message,DateTime>(
            
            elements: messages,
             groupBy: (messages)=> DateTime(2024),
             groupHeaderBuilder: (Message message)=> const SizedBox(),
             itemBuilder: (context,Message messages)=> Padding(
               padding: const EdgeInsets.all(10.0),
               child: Align(
                alignment: messages.isSentbyme
                ? Alignment.centerRight
                : Alignment.centerLeft,
                 child: Container(
                  height: 36,width: 100,
                  decoration: BoxDecoration(
                    color:messages.isSentbyme?
                     const Color(0xFF4257D3): const Color(0xFF999999),
                    borderRadius: BorderRadius.circular(18)
                  ),
                  child: Align(alignment: Alignment.center,
                    child: Text(messages.text,style: AppTextStyles.smalltitle.copyWith(color: const Color(0xFFFFFFFF)),)),
                 ),
               ),
             ),
             ),
        ),
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Container(width: 128,height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF7F9FF),
                  
                ),child: Text("I've Arrived",style: AppTextStyles.smalltitle.copyWith(color: const Color(0xFF4257D3)),),
                ),
                   Container(width: 128,height: 36,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(8),
                                   color: const Color(0xFFF7F9FF),
                                   
                                 ),child: Text("On my way",style: AppTextStyles.smalltitle.copyWith(color: const Color(0xFF4257D3)),),
                                 ),
                   Container(width: 128,height: 36,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 color: const Color(0xFFF7F9FF),
                                 
                               ),child: Text("Stuck in traffic",style: AppTextStyles.smalltitle.copyWith(color: const Color(0xFF4257D3)),),
                               )
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12,bottom: 12),
              child: SizedBox(
                width: 333,height: 42,
               
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 42,width: 246,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(26)
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            hintText: "Type your message",
                            hintStyle: AppTextStyles.smalltitle,
                            
                           border: InputBorder.none,
                            
                          ),
                        
                        ),
                      ),
                    ),
                    Container(
                      
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: BoxShape.circle
                      ),
                      child: IconButton(onPressed: (){
                        if(_controller.text.trim().isNotEmpty){
                          final message = Message(
                            text: _controller.text.trim(),
                             date: DateTime.now(),
                              isSentbyme: true);
                             
                              setState(() {
                                messages.add(message);
                              });
                            
                                    _controller.clear();
                          
                        }
                        
                         
                      }, icon: const Icon(Icons.send,color: Color(0xFF4257D3),)),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],),
    );
  }
}