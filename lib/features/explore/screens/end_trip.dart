
import 'package:driver_app/features/explore/screens/explore_payment.dart';
import 'package:driver_app/features/explore/widgets/time_line.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/utils/app_text_styles.dart';
import 'package:driver_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class EndTrip extends StatefulWidget {
  const EndTrip({super.key});

  @override
  State<EndTrip> createState()=> _EndTrip();
}
class _EndTrip extends State<EndTrip>{
  late GoogleMapController mapController;
  String? objectid;
  String pickup="";
  String dropoff="";
  double piclat=0;
  double piclong=0;
  double deslat=0;
  String user="";
  double destlong=0;
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  Location location = Location();
  LatLng? userLocation;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polyLines = {};
 late LatLng sourceLocation;
 late LatLng destinationLocation;
  StreamSubscription<LocationData>? locationSubscription;

  @override
  void initState() {
    super.initState();
    shared().then((_){
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
        Marker(markerId: MarkerId("source"), position: sourceLocation),
        Marker(markerId: MarkerId("user"), position: userLocation!),
        Marker(markerId: MarkerId("destination"), position: destinationLocation),
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
    PolylineId id = PolylineId('poly');
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
      result.points.forEach((point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print("Polyline Error: ${result.errorMessage}");
    }
    return polylineCoordinates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ userLocation == null
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
          zoomGesturesEnabled: true,   // Enable zooming
          rotateGesturesEnabled: true, // Enable rotation gestures
          tiltGesturesEnabled: true,
          markers:
          {
            Marker(
                markerId: MarkerId("_destination"),
                icon: BitmapDescriptor.defaultMarker,
                position: destinationLocation
            )
          },
          polylines: Set<Polyline>.of(polyLines.values),
        ),
         Padding(
  padding: EdgeInsets.only(
    top: ResponsiveSize.height(context, 340),
    left: ResponsiveSize.width(context, 10),
    right: ResponsiveSize.width(context, 10),
  ),
  child: Container(
    color: AppColors.backgroundColor,
    child: Padding(
      padding: EdgeInsets.only(
        top: ResponsiveSize.height(context, 588),
        left: ResponsiveSize.width(context, 10),
        right: ResponsiveSize.width(context, 10),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: ResponsiveSize.height(context, 36),
              width: ResponsiveSize.width(context, 36),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.purplebackground,
              ),
              child: const Icon(
                Icons.phone,
                color: AppColors.primaryColor,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(
                left: ResponsiveSize.width(context, 60),
              ),
              child: const Text(
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
              child: const Icon(
                Icons.message,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Container(
            height: ResponsiveSize.height(context, 46),
            width: ResponsiveSize.width(context, 278.56),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ResponsiveSize.width(context, 28),
              ),
            ),
            child: SlideAction(
              onSubmit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentTrip(),
                  ),
                );
              },
              outerColor: AppColors.greenColor,
              sliderButtonIcon: Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveSize.width(context, 2.56),
                ),
                child: Container(
                  height: ResponsiveSize.height(context, 40),
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
              text: "End trip",
              textStyle: AppTextStyles.smalltitle.copyWith(
                color: AppColors.backgroundColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ResponsiveSize.height(context, 17),
            ),
            child: ListTile(
              leading: Image.asset('assets/images/Ganesh.png'),
              title: const Text(
                "Ganesh Mahanta",
                style: AppTextStyles.baseStyle,
              ),
              trailing: Container(
                height: ResponsiveSize.height(context, 17),
                width: ResponsiveSize.width(context, 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResponsiveSize.width(context, 12),
                  ),
                  color: AppColors.backgroundColor,
                ),
                child: Row(
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
          SizedBox(
            height: ResponsiveSize.height(context, 10),
          ),
          TimeLinewidget(
            isfirst: true,
            islast: false,
            isPast: true,
            child: Padding(
              padding: EdgeInsets.only(
                left: ResponsiveSize.width(context, 8),
                top: ResponsiveSize.height(context, 25),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Pickup at",
                      style: AppTextStyles.baseStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: "\nDr. Rahalkar Hospital, Masanganj, Chhattisgarh 495001",
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
              padding: EdgeInsets.only(
                left: ResponsiveSize.width(context, 8),
                bottom: ResponsiveSize.height(context, 5),
              ),
              child: Text(
                " Drop Off ",
                style: AppTextStyles.baseStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
)

    ]
      ),
    );
  }
}

