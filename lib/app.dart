import 'package:flutter/material.dart';
import 'package:yollararo/router/router.dart';
import 'package:yollararo/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      theme: YTheme.yTheme,
      title: "Yo'llararo",
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
