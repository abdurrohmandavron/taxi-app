import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../presentations/screens/search/search.dart';
import '../../presentations/screens/destination/destination.dart';

class YPanelCubit extends Cubit<YPanelState> {
  YPanelCubit() : super(const YPanelState(DestinationPanel(), PanelState.OPEN, 400, 35));

  double panelPosition = 1.0;

  void searchPanel(BuildContext context) {
    emit(state.copyWith(panelWidget: const SearchPanel(), maxHeight: 700, minHeight: 200));
  }
}

class YPanelState {
  final Widget panelWidget;
  final PanelState panelState;
  final double maxHeight, minHeight;

  const YPanelState(
    this.panelWidget,
    this.panelState,
    this.maxHeight,
    this.minHeight,
  );

  YPanelState copyWith({
    Widget? panelWidget,
    PanelState? panelState,
    double? maxHeight,
    double? minHeight,
  }) {
    return YPanelState(
      panelWidget ?? this.panelWidget,
      panelState ?? this.panelState,
      maxHeight ?? this.maxHeight,
      minHeight ?? this.maxHeight,
    );
  }
}
