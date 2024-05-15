import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodiy_soft/core/widgets/w_button.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_request_dto.dart';
import 'package:vodiy_soft/features/main/presatation/state/main_bloc.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({Key? key}) : super(key: key);

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  LatLng _initialCameraPosition = const LatLng(37.4219983, -122.084);
  final TextEditingController _searchController = TextEditingController();
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _initialCameraPosition = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
      ),
      body: BlocListener<MainBloc, MainState>(
        listener: (context, state) {
          if(state is MainError){
            print(state.error);
          }
          if (state is MainLoaded) {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                content: Text(state.distanceResponseDto?.message.toString()??"Message"),
              );
            },);
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search location...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchLocation,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onTap: _handleMapTap,
                mapToolbarEnabled: true,
                onMapCreated: (controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: _initialCameraPosition,
                  zoom: 15.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: WButton(
                text: "Request location",
                onTap: (){
                  _requestLocation(distance: DistanceRequestDto(
                    latitude: "${_initialCameraPosition.latitude}",
                    longitude: "${_initialCameraPosition.longitude}",
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleMapTap(LatLng latLng) {
    _searchLocation();
  }

  void _requestLocation({
    required DistanceRequestDto distance,
}) {
    context.read<MainBloc>().add(
      MainRequestEvent(
        distanceRequestDto: distance,
      ),
    );
  }

  void _searchLocation() async {
    String input = _searchController.text;
    String apiKey = 'AIzaSyAkFkI_u5E54l8RPsyHZpwqVj1_1O_tbkc';
    String url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&fields=geometry&key=$apiKey';

    var uri = Uri.parse(url);
    var httpClient = HttpClient();

    try {
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        var data = json.decode(responseBody);
        double lat = data['candidates'][0]['geometry']['location']['lat'];
        double lng = data['candidates'][0]['geometry']['location']['lng'];
        LatLng position = LatLng(lat, lng);

        setState(() {
          _initialCameraPosition = LatLng(lat,lng);
        });

        // Move camera to the searched location
        mapController?.animateCamera(
          CameraUpdate.newLatLng(position),
        );
      } else {
        print('Failed to load search results');
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      httpClient.close();
    }
  }

}
