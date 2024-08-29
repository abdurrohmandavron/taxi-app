import 'package:flutter/material.dart';

import '../../../../blocs/map/map_bloc.dart';
import '../../../../blocs/map/map_event.dart';
import '../../../../presentations/widgets/custom_icon.dart';

class YMapCurrentPositionButton extends StatelessWidget {
  const YMapCurrentPositionButton({super.key, required this.bloc});

  final YMapBloc bloc;

  @override
  Widget build(BuildContext context) {
    return YIcon(
      Icons.location_searching,
      size: 40,
      iconSize: 24,
      backgroundColor: Colors.white,
      border: Colors.grey.withOpacity(.3),
      onPressed: () => bloc.add(FindMyPosition()),
    );
  }
}
