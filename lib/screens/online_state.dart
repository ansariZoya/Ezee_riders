import 'package:driver_app/commons/app_text_styles.dart';
import 'package:driver_app/screens/earning.dart';
import 'package:driver_app/screens/explore.dart';
import 'package:driver_app/widgets/help_widget.dart';
import 'package:driver_app/screens/more.dart';
import 'package:driver_app/screens/payout.dart';
import 'package:driver_app/screens/trip.dart';

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

  final List<Widget> screens = [
    const ExploreScreen(),
    const TripScreen(),
    const EarningScreen(),
    const PayOutScreen(),
    const MoreScreen(),
  ];
  void _onTapItem(int index) {
    setState(() {
      myIndex = index;
    });
  }

  void _showHelpPage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) {
          return const HelpScreen();
        });
  }

  void _showDialogebox(bool turningOn) {
    Future.microtask(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Builder(builder: (context) {
              return AlertDialog(
                shape:  const RoundedRectangleBorder(),
                content:SizedBox(
                  height: 249,width: 420,
                  child: Column(
                    children: [
                      Column(
                                        children: [
                                          Image.asset(turningOn
                      ? 'assets/images/green.png'
                      : 'assets/images/red.png'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            turningOn ? 'Go Online again?' : 'Go Offline?',
                                            style: turningOn? AppTextStyles.headline2:AppTextStyles.headline3
                                          ),
                                        ],
                                      ),const SizedBox(height: 10,),
                  Expanded(
                    child: Text(
                    turningOn
                        ? ' After going online you will recieving           new ride requests'
                        : 'After going offline you will not recieving  new ride requests',
                    style: AppTextStyles.smalltitle,
                    textAlign: TextAlign.center,
                                    ),
                  ), 
                    Container(child:  Row(
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
                              backgroundColor: turningOn
                                  ? const Color(0xFF24A665)
                                  : const Color(0xFFE75356),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                            ),
                            onPressed: () {
                              setState(() {
                                _isSwitched = turningOn;
                              });
                              Navigator.of(context).pop();
                            },
                            child:  const Text(
                              'Yes',
                              style: AppTextStyles.baseStyle2,
                            )),
                      )
                    ],
                  ))
                    ],
                  ),
                ),
                
                
                
              );
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF) ,
        flexibleSpace: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 29, bottom: 12),
          child: SizedBox(
            width: 360,
            height: 51,
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 19,
                      child: InkWell(
                          onTap: () => _showHelpPage(context),
                          child: const Icon(Icons.help_outline_rounded)),
                    ),
                    const SizedBox(
                      height: 19,
                      child: Icon(Icons.notifications_none_outlined),
                    ),
                    const SizedBox(
                      height: 19,
                      child: Icon(
                        Icons.warning_amber,
                        color: Color(0xFFE75356),
                      ),
                    )
                  ],
                ),
                Flexible(
                  child: CupertinoListTile(
                    trailing: SizedBox(
                      width: 48,
                      height: 25,
                      child: CupertinoSwitch(
                          activeColor: const Color(0xFF24A665),
                          value: _isSwitched,
                          onChanged: (bool value) {
                            _showDialogebox(value);
                          }),
                    ),
                    title: const Text(''),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: myIndex,
        children: screens,
      ),
      bottomNavigationBar: SizedBox(
        width: 360,
        height: 97,
        child: BottomNavigationBar(
            onTap: _onTapItem,
            currentIndex: myIndex,
            selectedItemColor: const Color(0xFF4257D3),
            unselectedItemColor: const Color(0xFF818587),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.two_wheeler_outlined), label: 'Trips'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.currency_rupee_rounded), label: 'Earning'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet), label: 'Payout'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More')
            ]),
      ),
    );
  }
}
