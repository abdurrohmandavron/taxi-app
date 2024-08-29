import 'package:equatable/equatable.dart';

import '../../data/models/lat_long_model.dart';

class YMapState extends Equatable {
  const YMapState({
    this.lat = .0,
    this.long = .0,
    this.from = const AppLatLong(lat: .0, long: .0),
    this.to = const AppLatLong(lat: .0, long: .0),
    required this.status,
  });

  final double lat;
  final double long;
  final AppLatLong from;
  final AppLatLong to;
  final YMapStatus status;

  YMapState copyWith({
    double? lat,
    double? long,
    AppLatLong? from,
    AppLatLong? to,
    YMapStatus? status,
  }) {
    return YMapState(
      lat: lat ?? this.lat,
      long: long ?? this.long,
      from: from ?? this.from,
      to: to ?? this.to,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [lat, long, from, to, status];
}

enum YMapStatus { initial, loading, success, failure, update }
