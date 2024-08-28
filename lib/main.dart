import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yollararo/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yandex_maps_mapkit/init.dart';
import 'package:yollararo/router/router.dart';
import 'package:yollararo/services/get_it.dart';
import 'package:yollararo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  /// Run App in Error Zone
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// Initialize Firebase
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    /// Set up error handling for Flutter errors
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    /// Initialize Hive for local storage
    await Hive.initFlutter();

    /// Check if it's the first time the user opens the app
    final onBoardingBox = await Hive.openBox('onBoarding');
    if (!onBoardingBox.containsKey('isFirstTime')) await onBoardingBox.put('isFirstTime', true);

    /// Check if user is signed in
    final authenticationBox = await Hive.openBox('authentication');
    if (!authenticationBox.containsKey('signedIn')) await authenticationBox.put('signedIn', false);

    /// Initialize Yandex Mapkit
    await dotenv.load(fileName: ".env");
    await initMapkit(apiKey: dotenv.env['MAP_API_KEY']!);

    /// Initialize Dependencies
    setup();

    /// Initialize AppRouter
    final appRouter = AppRouter();

    /// Run the App
    runApp(App(appRouter: appRouter));
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
