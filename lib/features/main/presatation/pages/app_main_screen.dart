import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vodiy_soft/core/widgets/w_button.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_request_dto.dart';
import 'package:vodiy_soft/features/main/presatation/state/main_bloc.dart';

@RoutePage()
class AppMainScreen extends StatefulWidget {
  const AppMainScreen({Key? key}) : super(key: key);

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  // late GoogleMapController mapController;
  LatLng _initialCameraPosition = const LatLng(37.4219983, -122.084);

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
            Expanded(
              child: GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (controller) {},
                initialCameraPosition: CameraPosition(
                  target: _initialCameraPosition,
                  zoom: 15.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: WButton(
                text: "Requst location",
                onTap: () {
                  context.read<MainBloc>().add(
                        MainRequestEvent(
                          distanceRequestDto: DistanceRequestDto(
                            latitude: "${_initialCameraPosition.latitude}",
                            longitude: "${_initialCameraPosition.longitude}",
                          ),
                        ),
                      );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
