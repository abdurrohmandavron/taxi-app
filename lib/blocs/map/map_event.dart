import 'package:equatable/equatable.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';

abstract class YMapEvent extends Equatable {
  const YMapEvent();

  @override
  List<Object> get props => [];
}

class MapCreated extends YMapEvent {
  final MapWindow mapWindow;

  const MapCreated(this.mapWindow);

  @override
  List<Object> get props => [mapWindow];
}

class GetCurrentPosition extends YMapEvent {}

class ChooseDestination extends YMapEvent {}

class FindMyPosition extends YMapEvent {}

class OpenPanel extends YMapEvent {
  final bool open;

  const OpenPanel(this.open);

  @override
  List<Object> get props => [];
}
