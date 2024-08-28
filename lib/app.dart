import 'package:flutter/material.dart';
import 'package:yollararo/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/blocs/map/map_bloc.dart';
import 'package:yollararo/cubits/search_cubit.dart';
import 'package:yollararo/cubits/services_cubit.dart';
import 'package:yollararo/presentations/theme/theme.dart';
import 'package:yollararo/cubits/sliding_panel_cubit.dart';

class App extends StatelessWidget {
  const App({super.key, required this.appRouter});

  final AppRouter appRouter;

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
        theme: YTheme.lightTheme,
        title: "Yo'llararo",
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
