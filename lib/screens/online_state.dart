
import 'package:driver_app/screens/help_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnlineState extends StatefulWidget {
  const OnlineState({super.key});

  @override
  State<OnlineState> createState() => _OnlineStateState();
}

class _OnlineStateState extends State<OnlineState> {
  bool _isSwitched = false;
  int myIndex = 0;
  void _showHelpPage(BuildContext context){
    showModalBottomSheet(context: context,
     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
     builder: (context){
      return const HelpScreen();
    });
  }
  void _showDialogebox(bool turningOn){
    Future.microtask((){
      
    showDialog(context: context, 
    builder: (BuildContext context){
      return Builder(
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              
            ),
            title:  
             Icon(
              turningOn ? Icons.info:Icons.error,
              size: 50,
              color: turningOn ? Colors.green: const Color(0xFFE75356),
            ),
           content: RichText(
             text: TextSpan(
              children: [
                TextSpan( text:turningOn? '          Go Online again?'
              : '               Go offline?',
              
              style:  turningOn ?
              const TextStyle(color:  Colors.green,fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'ProductSans'):
              const TextStyle(color: Color(0xFFE75356),fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'ProductSans' )),
              TextSpan(
                text: turningOn? '\n   After going online you will recieving new     \n                      ride requests':
                                  '\n  After going offline you will not recieving      \n                  new ride requests',
                                  style: const TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500,fontFamily: 'ProductSans')
              )  ] )),
            actions: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[200]),
                  onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text('No',style: TextStyle(color: Colors.black),)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: turningOn? Colors.green:const Color(0xFFE75356),
                  ),
                  onPressed: (){
                  setState(() {
                    _isSwitched = turningOn;
                  });Navigator.of(context).pop();
                }, child: const Text('Yes',style: TextStyle(color: Colors.white),))
              ],)
            ],
          );
        }
      );
    });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 12,bottom: 12),
          child: SizedBox(
            width: 360, height: 51,
             
            child: Row(
              
              children: [
               Row( children: [ //SizedBox(height:19,child: IconButton(onPressed: ()=> _showHelpPage(context), icon: const Icon(Icons.help_outline_rounded))),
          SizedBox(height: 19,child: InkWell(
            onTap: ()=> _showHelpPage(context),
            child: const Icon(Icons.help_outline_rounded)),),
            const SizedBox(height: 19,child: Icon(Icons.notifications_none_outlined),),
            const SizedBox(height: 19,child: Icon(Icons.warning_amber,color: Color(0xFFE75356),),)
              ],),
            Flexible(
              
              child: CupertinoListTile(
                trailing: SizedBox(
                  width: 48,height: 25,
                  child: CupertinoSwitch( activeColor: const Color(0xFF24A665),
                  value: _isSwitched, onChanged:(bool value){
                  _showDialogebox(value);
                                }),
                ),title: const Text(''),
               ),
            ),
            ],),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: 360, height: 97,
          child: BottomNavigationBar(
            onTap: (index){
              setState(() {
                myIndex = index;
              });
            },currentIndex: myIndex,
            selectedItemColor: const Color(0xFF4257D3),unselectedItemColor: const Color(0xFF818587),
            items: const [
            BottomNavigationBarItem(icon: Icon(Icons.explore),label: 'Explore'),
             BottomNavigationBarItem(icon: Icon(Icons.two_wheeler_outlined),label: 'Trips'),
              BottomNavigationBarItem(icon: Icon(Icons.currency_rupee_rounded),label: 'Earning'),
               BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet),label: 'Payout'),
                BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'More')
          ]),
        ),
       
      ),
    );
  }
}