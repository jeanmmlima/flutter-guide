import 'package:f10_camera_and_localization/screens/place_form_screen.dart';
import 'package:f10_camera_and_localization/screens/places_list_screen.dart';
import 'package:f10_camera_and_localization/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.indigo,
                secondary: Colors.amber,
              )),
      home: PlacesListScreen(),
      routes: {
        AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen(),
      },
    );
  }
}
