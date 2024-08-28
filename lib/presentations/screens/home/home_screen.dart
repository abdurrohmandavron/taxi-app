import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/cubits/sliding_panel_cubit.dart';
import 'package:yollararo/presentations/screens/home/widgets/home_drawer.dart';
import 'package:yollararo/presentations/screens/home/widgets/home_drawer_button.dart';
import 'package:yollararo/presentations/screens/home/widgets/home_sliding_up_panel.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YPanelCubit, YPanelState>(
      builder: (context, state) {
        final cubit = context.read<YPanelCubit>();

        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: const YHomeDrawer(),
          body: Stack(
            children: [
              /// Map & Panel
              YHomeSlidingUpPanel(cubit: cubit, state: state),

              /// Drawer Button
              const YHomeDrawerButton(),
            ],
          ),
        );
      },
    );
  }
}
