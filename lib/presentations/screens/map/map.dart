import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/blocs/map/map_bloc.dart';
import 'package:yollararo/blocs/map/map_state.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';
import 'package:yollararo/presentations/screens/map/widgets/map_pointer.dart';

import '../../../blocs/map/map_event.dart';

class MapPanel extends StatelessWidget {
  const MapPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YMapBloc, YMapState>(
      builder: (context, state) {
        final bloc = context.read<YMapBloc>();

        /// Yandex Map
        if (state.status == YMapStatus.success || state.status == YMapStatus.update) {
          return Stack(
            children: [
              /// Map
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: YandexMap(onMapCreated: (mapWindow) => bloc.add(MapCreated(mapWindow))),
              ),

              /// Pointer
              const YMapPointer(region: "Samarqand", city: "Urgut"),

              /// Current Position Button
              // YMapCurrentPositionButton(bloc: bloc), // TODO
            ],
          );
        }

        /// Progress Indicator
        else if (state.status == YMapStatus.loading || state.status == YMapStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        }

        /// Error Text
        else {
          return const Center(child: Text("Xatolik yuz berdi!"));
        }
      },
    );
  }
}
