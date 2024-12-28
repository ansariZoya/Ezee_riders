
import 'package:driver_app/features/emergency_contact/screens/emergency_contact.dart';
import 'package:driver_app/features/explore/screens/call_screen.dart';
import 'package:driver_app/features/explore/screens/enter_otp.dart';
import 'package:driver_app/features/explore/screens/message_screen.dart';
import 'package:driver_app/features/explore/screens/ride_cancel.dart';
import 'package:driver_app/features/explore/widgets/time_line.dart';
import 'package:driver_app/features/online/widgets/help_widget.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
class ArrivedTrip extends StatefulWidget {
  const ArrivedTrip({super.key});

  @override
  State<ArrivedTrip> createState() => _ArrivedTripState();
}

class _ArrivedTripState extends State<ArrivedTrip> {
  late GoogleMapController mapController;
  String pickup="";
  String dropoff="";
  double piclat=0;
  double piclong=0;
  double deslat=0;
  double destlong=0;
  String user="";
  String? objectid;
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  Location location = Location();
  LatLng? userLocation;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polyLines = {};
  late LatLng sourceLocation ;
  late LatLng destinationLocation;
  StreamSubscription<LocationData>? locationSubscription;

  @override
  void initState() {
    super.initState();
    shared().then((_) {
      locafetchUser(objectid).then((_) {
        setState(() {
          sourceLocation = LatLng(piclat, piclong);
          destinationLocation = LatLng(deslat, destlong);

          _updatePolyline();
        });
        _initializeLocation();
      });
    });
  }
  Future<void> shared() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    objectid=prefs.getString('ObjectId');
    print('Printing the Object ID: $objectid');
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }
  Future<void> locafetchUser(String? id) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/locafindUser/$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      pickup = data['currentAddress'];
      dropoff = data['destinationAddress'];
      piclat = data['currentLat'];
      piclong=data['currentLng'];
      deslat=data['destLat'];
      destlong=data['destLng'];
      user=data['userName'];
      print('Pickup: $pickup');
      print('Dropoff: $dropoff');
    } else if (response.statusCode == 404) {
      print('User not found');
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  Future<void> _initializeLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;


    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }


    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    locationSubscription = location.onLocationChanged.listen((newLocation) {
      setState(() {
        userLocation = LatLng(newLocation.latitude!, newLocation.longitude!);

        _updateMarkers();
        _cameraToPosition(userLocation!);
      });
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(target: pos, zoom: 14.0);
    await controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  void _updateMarkers() {
    setState(() {
      markers = {
        Marker(markerId: const MarkerId("source"), position: sourceLocation),
        Marker(markerId: const MarkerId("user"), position: userLocation!),
        Marker(markerId: const MarkerId("destination"), position: destinationLocation),
      };
    });
  }

  void _updatePolyline() async {
    clearPolylines();
    final coordinates = await getPolylinePoints();
    generatePolylinefromPoints(coordinates);
  }

  void clearPolylines() {
    setState(() {
      polyLines.clear();
    });
  }

  void generatePolylinefromPoints(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polyLines[id] = polyline;
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyBjGyyXWfWYY0gG4OlJTFQ82Gr6SU7siw8',
      request: PolylineRequest(
        origin: PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        destination: PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
        mode: TravelMode.driving,
      ),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print("Polyline Error: ${result.errorMessage}");
    }
    return polylineCoordinates;
  }
 void _showDialogebox2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 207,
              child: Dialog(
                insetPadding: const EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                backgroundColor: AppColors.backgroundColor,
                child: SizedBox(
               height: ResponsiveSize.height(context, 249),
                              width: ResponsiveSize.width(context, 326),
                  child: Column(
                    children: [
                       SizedBox(
                        height:  ResponsiveSize.height(context, 32),
                      ),
                      Image.asset("assets/images/red.png"),
                      SizedBox(
                        height: ResponsiveSize.height(context,20),
                      ),
                      Text(
                        "Call your emergency contact?",
                        style: AppTextStyles.headline3,
                      ),
                       SizedBox(
                        height:  ResponsiveSize.height(context, 5),
                      ),
                      Text(
                        "Your location will be shared with your \nemergency contact along with it!",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.smalltitle,
                      ),
                       SizedBox(
                        height:  ResponsiveSize.height(context, 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height:  ResponsiveSize.height(context, 42),
                            width:  ResponsiveSize.width(context, 136),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.backgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancel',
                                style: AppTextStyles.baseStyle2.copyWith(color: AppColors.newgreyColor),
                              ),
                            ),
                          ),
                          // 'Call' button
                          SizedBox(
                              height:  ResponsiveSize.height(context, 42),
                            width:  ResponsiveSize.width(context, 136),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:AppColors.redColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              Navigator.push(
                                context, // Use the original context to navigate
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EmergencyContact(),
                                ),
                              );
                              },
                              child:  Row(
                                children: [
                                  const Icon(
                                    Icons.call,
                                    color: AppColors.backgroundColor
                                  ),
                                  SizedBox(width: ResponsiveSize.width(context, 4)),
                                  const Text(
                                    'Call',
                                    style: AppTextStyles.baseStyle2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  void _showDialogebox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children: [
              Positioned(
                top: 207,
                child: Dialog(
                  insetPadding: const EdgeInsets.only(left: 17, right: 17),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  backgroundColor: AppColors.backgroundColor,
                  child: SizedBox(
                    height:  ResponsiveSize.height(context, 249),
                    width:  ResponsiveSize.width(context, 326),
                    child: Column(
                      children: [
                         SizedBox(
                          height:  ResponsiveSize.height(context, 32),
                        ),
                        Image.asset("assets/images/red.png"),
                         SizedBox(height:  ResponsiveSize.height(context,10),),
                        Text("Do you wanna cancel pickup?",
                            style: AppTextStyles.headline3),
                         SizedBox(
                          height: ResponsiveSize.height(context, 5),
                        ),
                        Text(
                          "You cannot undo this action!",
                          style: AppTextStyles.smalltitle,
                        ),
                        SizedBox(
                          height: ResponsiveSize.height(context, 5),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: " 9",
                              style: AppTextStyles.smalltitle
                                  .copyWith(color: AppColors.redColor)),
                          TextSpan(
                              text: "/10 cancellation left ",
                              style: AppTextStyles.smalltitle)
                        ])),
                         SizedBox(
                          height: ResponsiveSize.height(context, 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: ResponsiveSize.height(context, 42),
                              width: ResponsiveSize.width(context, 130),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.backgroundColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child:  Text(
                                    'No',
                                    style: AppTextStyles.baseStyle2.copyWith(color: AppColors.newgreyColor),
                                  )),
                            ),
                            SizedBox(
                              height: ResponsiveSize.height(context, 42),
                              width: ResponsiveSize.width(context, 130),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.redColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RideCancel()));
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: AppTextStyles.baseStyle2,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

 
  void _showHelpPage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const HelpScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            color: AppColors.backgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveSize.width(context, 12),
                vertical: ResponsiveSize.height(context, 12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 29),
                child: SizedBox(
                  width: ResponsiveSize.width(context, 360),
                  height: ResponsiveSize.height(context, 51),
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: ResponsiveSize.height(context, 19),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: ResponsiveSize.width(context, 2.5),
                                right: ResponsiveSize.width(context, 2.5),
                              ),
                              child: InkWell(
                                  onTap: () => _showHelpPage(context),
                                  child:
                                      const Icon(Icons.help_outline_rounded)),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSize.height(context, 19),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: ResponsiveSize.width(context, 2.5),
                                right: ResponsiveSize.width(context, 2.5),
                              ),
                              child:
                                  const Icon(Icons.notifications_none_outlined),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSize.height(context, 19),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: ResponsiveSize.width(context, 2.5),
                                right: ResponsiveSize.width(context, 2.5),
                              ),
                              child: const Icon(
                                Icons.warning_amber,
                                color: AppColors.redColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      body: Stack(
        children: [
          userLocation == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
            onMapCreated: ((GoogleMapController controller )=> _mapController.complete(controller)),
            initialCameraPosition: CameraPosition(
              target: userLocation!,
              zoom: 14.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            tiltGesturesEnabled: true,
            markers:
            {
              Marker(
                  markerId: const MarkerId("_destination"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: destinationLocation
              )
            },
            polylines: Set<Polyline>.of(polyLines.values),
          ),
          // Iske baad apna UI daaldoHaa
     Padding(
  padding: const EdgeInsets.only(top: 570),
  child: Container(
    height: ResponsiveSize.height(context, 444),
    width: ResponsiveSize.width(context, 360),
    color: AppColors.backgroundColor,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: ListTile(
            leading: Container(
              height: ResponsiveSize.height(context, 36),
              width: ResponsiveSize.width(context, 36),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.purplebackground,
              ),
              child: IconButton(
                icon: const Center(
                  child: Icon(
                    Icons.phone,
                    color: AppColors.primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CallScreen(),
                    ),
                  );
                },
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                "0 min away",
                style: AppTextStyles.baseStyle,
              ),
            ),
            trailing: Container(
              height: ResponsiveSize.height(context, 36),
              width: ResponsiveSize.width(context, 36),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.purplebackground,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.message,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MessageScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Container(
          height: ResponsiveSize.height(context, 40),
          width: ResponsiveSize.width(context, 278.56),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
          ),
          child: SlideAction(
            onSubmit: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EnterOtP()),
              );
              return null;
            },
            outerColor: AppColors.greenColor,
            sliderButtonIcon: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Container(
                height: ResponsiveSize.height(context, 30),
                width: ResponsiveSize.width(context, 40),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.backgroundColor,
                ),
                child: const Icon(
                  Icons.two_wheeler,
                  size: 19,
                  color: AppColors.newgreenColor,
                ),
              ),
            ),
            sliderButtonIconPadding: 2,
            text: "Arrived",
            textStyle: AppTextStyles.smalltitle.copyWith(color: AppColors.backgroundColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: ResponsiveSize.height(context, 17)),
          child: ListTile(
            leading: Image.asset('assets/images/Ganesh.png'),
            title: const Text(
              "Ganesh Mahanta",
              style: AppTextStyles.baseStyle,
            ),
            trailing: Container(
              height: ResponsiveSize.height(context, 17),
              width: ResponsiveSize.height(context, 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.backgroundColor,
                border: Border.all(color: AppColors.newgreyColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "4.4",
                    style: AppTextStyles.subtitle,
                  ),
                  const Icon(
                    Icons.star,
                    color: Color(0xFFFFD600),
                    size: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: ResponsiveSize.height(context, 10)),
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: SizedBox(
            height: ResponsiveSize.height(context, 80),
            child: TimeLinewidget(
              isfirst: true,
              islast: false,
              isPast: true,
              child: SizedBox(
                height: ResponsiveSize.height(context, 70),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ResponsiveSize.width(context, 8),
                    top: ResponsiveSize.height(context, 20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Pickup at",
                                style: AppTextStyles.baseStyle.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Dr. Rahalkar Hospital, Masanganj, Chhattisgarh 495001",
                        style: AppTextStyles.smalltitle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: TimeLinewidget(
            isfirst: false,
            islast: true,
            isPast: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Drop Off",
                style: AppTextStyles.baseStyle.copyWith(fontSize: 16),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            _showDialogebox();
          },
          child: Text(
            "Cancel ride",
            style: AppTextStyles.headline3.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: ResponsiveSize.height(context, 11),
            horizontal: ResponsiveSize.height(context, 24),
          ),
          child: SizedBox(
            width: ResponsiveSize.width(context, 327),
            height: ResponsiveSize.height(context, 38),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                _showDialogebox2();
              },
              child: Text(
                "SOS",
                style: AppTextStyles.smalltitle.copyWith(color: AppColors.backgroundColor),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
)

        ]
      ));
  }
}

