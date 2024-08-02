import 'package:flutter/material.dart';
import 'package:yollararo/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      title: "Yo'llararo",
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
