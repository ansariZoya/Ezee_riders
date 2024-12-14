import 'package:driver_app/features/explore/screens/arrived_trip.dart';
import 'package:driver_app/features/explore/widgets/cancel.dart';
import 'package:driver_app/features/explore/widgets/time_line.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen> {
  late GoogleMapController mapController;
  late IO.Socket socket;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  Location location = Location();
  LatLng? userLocation;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polyLines = {};
  LatLng sourceLocation = const LatLng(37.6149, -122.415);
  LatLng destinationLocation = const LatLng(37.6172, -122.384);
  StreamSubscription<LocationData>? locationSubscription;
  bool isRideRequestAvailable = false;
  Map<String, dynamic> rideRequestData = {};

  @override
  void initState() {
    super.initState();
    initializeSocket();
    _initializeLocation().then((_) {});
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }

  void initializeSocket() {
    socket = IO.io('http://192.168.1.5:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.on('connect', (_) {});

    socket.on('removeRideRequest', (data) {
      setState(() {
        isRideRequestAvailable = false;
      });
      print(isRideRequestAvailable);
    });
    socket.on('disconnect', (_) {
      print('Disconnected from server');
    });
  }

  void acceptRide() {
    socket.emit('acceptRide', {
      'rideId': '123',
      'driverId': 'driver123',
      'name': 'Driver_Name',
      'car': 'Driver_car', // Replace with driver ID
      'userSocketId': rideRequestData['userId'],
    });

    setState(() {
      isRideRequestAvailable = false;
      rideRequestData = {};
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ArrivedTrip()),
    );
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

        _cameraToPosition(userLocation!);
        socket.emit('updateLocation', {
          'driverId': socket.id,
          'lat': newLocation.latitude!,
          'lon': newLocation.longitude!
        });
        socket.on('newRideRequest', (data) async {
          print('Received the Request: $data');
          setState(() {
            isRideRequestAvailable = true;
            rideRequestData = data;
          });
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('ObjectId', data['objectid'].toString());
          print('Ride request data saved to shared preferences');
          print(data['objectid']);
        });
      });
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(target: pos, zoom: 14.0);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        userLocation == null
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  onMapCreated: ((GoogleMapController controller) =>
                      _mapController.complete(controller)),
                  initialCameraPosition: CameraPosition(
                    target: userLocation!,
                    zoom: 14.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
        if (isRideRequestAvailable)
        


Padding(
  padding: EdgeInsets.only(top: ResponsiveSize.height(context, 374)),
  child: Padding(
    padding: EdgeInsets.symmetric(
      horizontal: ResponsiveSize.width(context, 12),
      vertical: ResponsiveSize.height(context, 16),
    ),
    child: Container(
      height: ResponsiveSize.height(context, 298),
      width: ResponsiveSize.width(context, 326),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(ResponsiveSize.width(context, 12)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 17,
            spreadRadius: 12,
            offset: Offset(0, 4),
            color: AppColors.newShadowColor,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(ResponsiveSize.width(context, 16)),
        child: SizedBox(
          width: ResponsiveSize.width(context, 301),
          height: ResponsiveSize.height(context, 216),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Online payment",
                              style: AppTextStyles.baseStyle.copyWith(
                                color: AppColors.greytextColor,
                              ),
                            ),
                            const TextSpan(
                              text: ' ₹120.00',
                              style: AppTextStyles.baseStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: ResponsiveSize.width(context, 70),
                      ),
                      const CancelProgress(),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: ResponsiveSize.height(context, 24),
                    width: ResponsiveSize.width(context, 71),
                    decoration: BoxDecoration(
                      color: AppColors.newBoxColor,
                      borderRadius: BorderRadius.circular(ResponsiveSize.width(context, 18)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/acute.jpg',
                          height: ResponsiveSize.height(context, 16),
                          width: ResponsiveSize.width(context, 16),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: ResponsiveSize.width(context, 5)),
                        Text(
                          "12 min",
                          style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveSize.height(context, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: ResponsiveSize.width(context, 8)),
                  Container(
                    height: ResponsiveSize.height(context, 24),
                    width: ResponsiveSize.width(context, 88),
                    decoration: BoxDecoration(
                      color: AppColors.newBoxColor,
                      borderRadius: BorderRadius.circular(ResponsiveSize.width(context, 18)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: ResponsiveSize.width(context, 5)),
                        Text(
                          "2Km away",
                          style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveSize.height(context, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveSize.height(context, 75),
                child: TimeLinewidget(
                  isfirst: true,
                  islast: false,
                  isPast: true,
                  child: Padding(
                    padding: EdgeInsets.only(left: ResponsiveSize.width(context, 8), top: ResponsiveSize.height(context, 30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pickup at 2km away",
                          style: AppTextStyles.baseStyle.copyWith(fontSize: ResponsiveSize.height(context, 13.28)),
                        ),
                        SizedBox(height: ResponsiveSize.height(context, 1)),
                        Text(
                          "Dr. Rahalkar Hospital, Masanganj, Chhattisgarh 495001",
                          style: AppTextStyles.smalltitle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TimeLinewidget(
                isfirst: false,
                islast: true,
                isPast: false,
                child: Padding(
                  padding: EdgeInsets.only(left: ResponsiveSize.width(context, 8)),
                  child: Text(
                    "Drop Off 8km",
                    style: AppTextStyles.baseStyle.copyWith(fontSize: ResponsiveSize.height(context, 13.28)),
                  ),
                ),
              ),
              SizedBox(
                width: ResponsiveSize.width(context, 298),
                height: ResponsiveSize.height(context, 42),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ResponsiveSize.width(context, 8)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ArrivedTrip()),
                    );
                  },
                  child: Text(
                    "Accept",
                    style: AppTextStyles.smalltitle.copyWith(color: AppColors.backgroundColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
)

      ],
    );
  }
}
