import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yollararo/cubits/sliding_panel_cubit.dart';
import 'package:yollararo/presentations/screens/map/map.dart';

class YHomeSlidingUpPanel extends StatelessWidget {
  const YHomeSlidingUpPanel({
    super.key,
    required this.cubit,
    required this.state,
  });

  final YPanelCubit cubit;
  final YPanelState state;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      parallaxOffset: .5,
      parallaxEnabled: true,
      body: const MapPanel(),
      panel: state.panelWidget,
      maxHeight: state.maxHeight,
      minHeight: state.minHeight,
      defaultPanelState: PanelState.OPEN,
    );
  }
}
