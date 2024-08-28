import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:flutter/widgets.dart' hide Animation;
import 'package:yandex_maps_mapkit/mapkit_factory.dart';
import 'package:yollararo/data/models/lat_long_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_maps_mapkit/image.dart' as ymap_image;
import 'package:yollararo/services/app_location_service.dart';

import 'map_event.dart';
import 'map_state.dart';

class YMapBloc extends Bloc<YMapEvent, YMapState> {
  YMapBloc() : super(const YMapState(status: YMapStatus.initial)) {
    mapkit.onStart();
    on<GetCurrentPosition>(_onGetCurrentPosition);
    on<MapCreated>(_onMapCreated);
    on<ChooseDestination>(_onChooseDestination);
    on<FindMyPosition>(_onFindMyPosition);

    add(GetCurrentPosition());
  }

  late MapWindow mapWindow;

  Future<void> _onGetCurrentPosition(GetCurrentPosition event, Emitter<YMapState> emit) async {
    YMapState newState = const YMapState(status: YMapStatus.loading);

    emit(newState);

    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      final position = await LocationService().getCurrentLocation();

      newState = YMapState(lat: position.lat, long: position.long, status: YMapStatus.success);
      emit(newState);
    } else {
      newState = const YMapState(status: YMapStatus.failure);
      emit(newState);
    }
  }

  Future<void> _onMapCreated(MapCreated event, Emitter<YMapState> emit) async {
    try {
      mapWindow = event.mapWindow;

      final map = event.mapWindow.map;

      final point = Point(latitude: state.lat, longitude: state.long);

      map.mapObjects.addPlacemark()
        ..geometry = point
        ..setIconWithStyle(
          ymap_image.ImageProvider.fromImageProvider(const AssetImage("assets/icons/me-pointer.png")),
          const IconStyle(scale: 1.3, anchor: math.Point(0.5, 0.5)),
        );

      _moveCamera(map, point);
    } catch (e) {
      log("Couln't get current position.");
    }
  }

  void _onFindMyPosition(FindMyPosition event, Emitter<YMapState> emit) {
    final map = mapWindow.map;

    final point = Point(latitude: state.lat, longitude: state.long);

    _moveCamera(map, point);
  }

  void _moveCamera(Map map, Point point) {
    map.moveWithAnimation(
      CameraPosition(point, zoom: 18.0, azimuth: .0, tilt: .0),
      const Animation(AnimationType.Linear, duration: 1.0),
    );
  }

  Future<void> _onChooseDestination(ChooseDestination event, Emitter<YMapState> emit) async {
    final map = mapWindow.map;

    final point = map.cameraPosition.target;

    final newState = state.copyWith(from: AppLatLong(lat: point.latitude, long: point.longitude));

    emit(newState);
  }
}
