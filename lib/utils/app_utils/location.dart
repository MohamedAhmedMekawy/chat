// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart'
// as PermissionHandler;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:geolocator/geolocator.dart' as geolocator;


// Future<void> openMap(double latitude, double longitude) async {
//   String googleUrl =
//       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//   if (await canLaunch(googleUrl)) {
//     await launch(googleUrl);
//   } else {
//     throw 'Could not open the map.';
//   }
// }

// Future<void> checkGPSPermission() async {
//   if (await PermissionHandler.Permission.location.isDenied) {
//     await [
//       Permission.location,
//     ].request();
//   }
// }

// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   return await Geolocator.getCurrentPosition();
// }

// Future<LatLng?> getLocation() async {
//   LatLng? mainLocation;
//   LocationPermission permission =await Geolocator.checkPermission();
//   if(permission==LocationPermission.whileInUse||permission==LocationPermission.always){
//     return Geolocator.isLocationServiceEnabled().then(
//           (value) async {
//         var currentLocation = await Geolocator.getCurrentPosition(
//             desiredAccuracy: geolocator.LocationAccuracy.high);
//         mainLocation =
//             LatLng(currentLocation.latitude, currentLocation.longitude);
//         debugPrint(mainLocation);
//         return mainLocation;
//       },
//     );
//   }if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//   else{
//     checkGPSPermission().then((value) => getLocation());
//   }
// }
