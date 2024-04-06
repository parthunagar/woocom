// import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:woocom_3_16_9/const/constant.dart';
// import 'dart:async';
// import 'dart:math';
// import 'package:google_api_headers/google_api_headers.dart';
//
// class MyAppSearch extends StatefulWidget {
//   @override
//   _MyAppSearchState createState() => _MyAppSearchState();
// }
//
// final homeScaffoldKey = GlobalKey<ScaffoldState>();
//
// class _MyAppSearchState extends State<MyAppSearch> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: homeScaffoldKey,
//       appBar: AppBar(
//         title: Text("My App"),
//       ),
//       body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: _handlePressButton,
//                 child: Text("Search places"),
//               ),
//
//             ],
//           )),
//     );
//   }
//
//   void onError(PlacesAutocompleteResponse response) {
//     print(response.errorMessage.toString());
//     homeScaffoldKey.currentState!.showSnackBar(
//       SnackBar(content: Text(response.errorMessage!)),
//     );
//   }
//
//   Future<void> _handlePressButton() async {
//     // show input autocomplete with selected mode
//     // then get the Prediction selected
//     Prediction? p = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: kGoogleApiKey,
//       onError: onError,
//       radius: 10000000,
//       mode: Mode.fullscreen,
//       types: [],
//       strictbounds: false,
//       language: "fr",
//       decoration: InputDecoration(
//         hintText: 'Search',
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       components: [Component(Component.country, "fr")],
//     );
//
//     displayPrediction(p!, homeScaffoldKey.currentState!);
//   }
// }
//
// Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
//   if (p != null) {
//     // get detail (lat/lng)
//    try{
//      GoogleMapsPlaces _places = GoogleMapsPlaces(
//        apiKey: kGoogleApiKey,
//        apiHeaders: await GoogleApiHeaders().getHeaders(),
//      );
//      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId!);
//      final lat = detail.result.geometry!.location.lat;
//      final lng = detail.result.geometry!.location.lng;
//      print("${p.description} - $lat/$lng");
//      scaffold.showSnackBar(
//        SnackBar(content: Text("${p.description} - $lat/$lng")),
//      );
//    }
//    catch(e){
//      print("ERROR : "+e.toString());
//    }
//   }
//
// }
//
