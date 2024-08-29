import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/router.dart';
import '../blocs/map/map_bloc.dart';
import '../cubits/search_cubit.dart';
import '../cubits/services_cubit.dart';
import '../presentations/theme/theme.dart';
import '../cubits/sliding_panel_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => YMapBloc()),
        BlocProvider(create: (context) => YSearchCubit()),
        BlocProvider(create: (context) => YPanelCubit()),
        BlocProvider(create: (context) => YServiceCubit()),
      ],
      child: MaterialApp.router(
        title: "Yo'llararo",
        theme: YTheme.lightTheme,
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
