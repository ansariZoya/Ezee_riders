import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/features/explore/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:driver_app/utils/responsive_size.dart'; // Import the ResponsiveSize class

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [
    Message(text: 'Arrived Today', date: DateTime.now(), isSentbyme: true),
    Message(text: 'Okay', date: DateTime.now(), isSentbyme: false),
  ];

  @override
  Widget build(BuildContext context) {
    DateTime specificTime = DateTime(2024, 11, 21, 10, 36);
    String formattedTime = DateFormat('hh:mm a').format(specificTime);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1C1B1F)),
        ),
        title: const Text("Ganesh Mahanta", style: AppTextStyles.baseStyle),
      ),
      body: Column(
        children: [
          Text("Chat", style: AppTextStyles.smalltitle),
          Expanded(
            child: GroupedListView<Message, DateTime>(
              elements: messages,
              groupBy: (messages) => DateTime(2024),
              groupHeaderBuilder: (Message message) => const SizedBox(),
              itemBuilder: (context, Message messages) => Padding(
                padding: EdgeInsets.all(ResponsiveSize.width(context, 10)), // Updated with ResponsiveSize
                child: Align(
                  alignment: messages.isSentbyme
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(
                        height: ResponsiveSize.height(context, 36), 
                        width: ResponsiveSize.width(context, 100), 
                      
                        decoration: BoxDecoration(
                          color: messages.isSentbyme
                              ?AppColors.primaryColor
                              : AppColors.messageBoxColor,
                          borderRadius: BorderRadius.circular(38),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            messages.text,
                            style: AppTextStyles.smalltitle.copyWith(
                                color: AppColors.backgroundColor),
                          ),
                        ),
                      ),
                      
                      SizedBox(
                        height: ResponsiveSize.height(context, 13), 
                        width: ResponsiveSize.width(context, 55),
                        child:messages.isSentbyme ?  Padding(
                          padding:  EdgeInsets.only(top: ResponsiveSize.height(context, 3), 
                      ),
                          child: Row(
                            children: [
                              const Icon(Icons.check,color: AppColors.newgreyColor,size: 13,),
                              Text("3:34 PM",style: AppTextStyles.subtitle,),
                            ],
                          ),
                        ):Container()
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: ResponsiveSize.width(context, 128), // Updated with ResponsiveSize
                      height: ResponsiveSize.height(context, 36), // Updated with ResponsiveSize
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:AppColors.messageColor,
                      ),
                      child: Text(
                        "I've Arrived",
                        style: AppTextStyles.smalltitle.copyWith(
                            color: AppColors.primaryColor),
                      ),
                    ),
                    Container(
                      width: ResponsiveSize.width(context, 128), // Updated with ResponsiveSize
                      height: ResponsiveSize.height(context, 36), // Updated with ResponsiveSize
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:AppColors.messageColor
                      ),
                      child: Text(
                        "On my way",
                        style: AppTextStyles.smalltitle.copyWith(
                            color:AppColors.primaryColor),
                      ),
                    ),
                    Container(
                      width: ResponsiveSize.width(context, 128), // Updated with ResponsiveSize
                      height: ResponsiveSize.height(context, 36), // Updated with ResponsiveSize
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.messageColor,
                      ),
                      child: Text(
                        "Stuck in traffic",
                        style: AppTextStyles.smalltitle.copyWith(
                            color:AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveSize.width(context, 12), // Updated with ResponsiveSize
                  bottom: ResponsiveSize.height(context, 12), // Updated with ResponsiveSize
                ),
                child: SizedBox(
                  width: ResponsiveSize.width(context, 333), // Updated with ResponsiveSize
                  height: ResponsiveSize.height(context, 42), // Updated with ResponsiveSize
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: ResponsiveSize.height(context, 42), // Updated with ResponsiveSize
                          decoration: BoxDecoration(
                            color: AppColors.newColor,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(ResponsiveSize.height(context, 12)), // Updated with ResponsiveSize
                              hintText: "Type your message",
                              hintStyle: AppTextStyles.smalltitle,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.newColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (_controller.text.trim().isNotEmpty) {
                              final message = Message(
                                text: _controller.text.trim(),
                                date: DateTime.now(),
                                isSentbyme: true,
                              );

                              setState(() {
                                messages.add(message);
                              });

                              _controller.clear();
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            color:AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
