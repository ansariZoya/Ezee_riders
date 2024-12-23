import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/features/earning/screens/earning.dart';
import 'package:driver_app/features/explore/screens/explore.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:driver_app/features/online/widgets/help_widget.dart';
import 'package:driver_app/features/more/screen/more.dart';
import 'package:driver_app/features/payout/screens/payout.dart';
import 'package:driver_app/features/trips/screens/trip.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnlineState extends StatefulWidget {
  const OnlineState({super.key});

  @override
  State<OnlineState> createState() => _OnlineStateState();
}

class _OnlineStateState extends State<OnlineState> {
  bool _isSwitched = false;
  int myIndex = 0;

  @override
  void initState(){
    super.initState();
   _loadOnlineStatus();}

    Future<void> _loadOnlineStatus() async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _isSwitched= prefs.getBool('isOnline') ?? false;
      });
    } 
  
  Future<void> _setOnlineStatus(bool status) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnline', status);
  }
    
 

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
                backgroundColor: AppColors.backgroundColor,
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                  
                ),
                content:SizedBox(
                  height:ResponsiveSize.height(context, 197)
                  ,width: ResponsiveSize.width(context, 340),
                 
                  child: Column(
                    children: [
                      Column(
                                        children: [
                                          Image.asset(turningOn
                      ? 'assets/images/green.png'
                      : 'assets/images/red.png'),
                                          SizedBox(
                                            height: ResponsiveSize.height(context, 5)
                                          ),
                                          Text(
                                            turningOn ? 'Go Online again?' : 'Go Offline?',
                                            style: turningOn? AppTextStyles.headline2:AppTextStyles.headline3
                                          ),
                                        ],
                                      ),SizedBox(height: ResponsiveSize.height(context, 5)),
                  Text(
                  turningOn
                      ? ' After going online you will recieving           new ride requests'
                      : 'After going offline you will not recieving  new ride requests',
                  style: AppTextStyles.smalltitle,
                  textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: ResponsiveSize.height(context, 30)),
                    Container(child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: ResponsiveSize.height(context, 42),width: ResponsiveSize.width(context, 100),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.backgroundColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child:   Text(
                              'No',
                              style: AppTextStyles.baseStyle2.copyWith(
                                color: AppColors.newgreyColor
                              ) ,
                            )),
                      ),
                      SizedBox(height: ResponsiveSize.height(context, 42),width: ResponsiveSize.width(context, 100),
                        child: ElevatedButton(
                            style:
                             ElevatedButton.styleFrom(
                              backgroundColor: turningOn
                                  ? AppColors.greenColor
                                  : AppColors.redColor,
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
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        
        flexibleSpace: Container(
          color:AppColors.backgroundColor ,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveSize.width(context, 12),
              vertical: ResponsiveSize.height(context, 12),
            ),
                
            child: Padding(
              padding: const EdgeInsets.only(top: 29),
              child: SizedBox(
               width: ResponsiveSize.width(context, 360),
                height:  ResponsiveSize.height(context, 51),
                
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: ResponsiveSize.height(context, 19),
                          child: Padding(
                            padding: EdgeInsets.only(left: ResponsiveSize.width(context,2.5),
                            right: ResponsiveSize.width(context,2.5),),
                            child: InkWell(
                                onTap: () => _showHelpPage(context),
                                child: const Icon(Icons.help_outline_rounded)),
                          ),
                        ),
                      SizedBox(
                          height: ResponsiveSize.height(context, 19),
                          child: Padding(
                            padding: EdgeInsets.only(left: ResponsiveSize.width(context,2.5),
                            right: ResponsiveSize.width(context,2.5),),
                            child: const Icon(Icons.notifications_none_outlined),
                          ),
                        ),
                       SizedBox(
                           height: ResponsiveSize.height(context, 19),
                          child: Padding(
                            padding:EdgeInsets.only(left: ResponsiveSize.width(context,2.5),
                            right: ResponsiveSize.width(context,2.5),),
                            child: const Icon(
                              Icons.warning_amber,
                              color: AppColors.redColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Flexible(
                      child: CupertinoListTile(
                        trailing: SizedBox(
                          width: ResponsiveSize.width(context, 48),
                          height: ResponsiveSize.height(context,25),
                          child: CupertinoSwitch(
                              activeColor: AppColors.greenColor,
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
        ),
      ),
      body: IndexedStack(
        index: myIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: AppColors.backgroundColor,
        width:ResponsiveSize.width(context, 360),
        height: ResponsiveSize.height(context, 97),
        child: BottomNavigationBar(
            onTap: _onTapItem,
            currentIndex: myIndex,
            selectedItemColor:AppColors.primaryColor,
            unselectedItemColor: AppColors.greytextColor,
            unselectedLabelStyle: AppTextStyles.subtitle.copyWith(
              fontSize: 8
            ),
            selectedLabelStyle: AppTextStyles.subtitle.copyWith(
              fontSize: 10.5,
              color: AppColors.primaryColor
            ),
            items: const [
              BottomNavigationBarItem(
                backgroundColor:AppColors.backgroundColor,
                  icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(
                 backgroundColor: AppColors.backgroundColor,
                  icon: Icon(Icons.two_wheeler_outlined), label: 'Trips'),
              BottomNavigationBarItem(
                 backgroundColor: AppColors.backgroundColor,
                  icon: Icon(Icons.currency_rupee_rounded), label: 'Earning'),
              BottomNavigationBarItem(
                 backgroundColor: AppColors.backgroundColor,
                  icon: Icon(Icons.account_balance_wallet), label: 'Payout'),
              BottomNavigationBarItem(
                 backgroundColor: AppColors.backgroundColor,
                icon: Icon(Icons.menu), label: 'More',
                )
            ]),
      ),
    );
  }
}
