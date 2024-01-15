import 'package:flutter/material.dart';
import 'package:flutter_test5/provider/great_places.dart';
import 'package:flutter_test5/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import './screens/places_list_screen.dart';
import './screens/place_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.amber,
        ),
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
          PlaceDetailScreen.routeName:(context) =>const  PlaceDetailScreen(),
        },
      ),
    );
  }
}
