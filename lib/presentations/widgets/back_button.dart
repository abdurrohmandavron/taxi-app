import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/map/map_bloc.dart';
import '../../blocs/map/map_event.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../presentations/widgets/custom_icon.dart';

class YBackButton extends StatelessWidget {
  const YBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return YIcon(
      FeatherIcons.arrowLeft,
      size: 40,
      iconSize: 24,
      backgroundColor: Colors.white,
      border: Colors.grey.withOpacity(.3),
      onPressed: () => context.read<YMapBloc>().add(FindMyPosition()),
    );
  }
}
