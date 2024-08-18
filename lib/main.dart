import 'dart:async';

import 'package:yollararo/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yandex_maps_mapkit/init.dart';
import 'package:yollararo/services/getit.dart';
import 'package:yollararo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  /// Run App in Error Zone
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// Initialize Firebase
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    /// Initialize Hive for local storage
    await Hive.initFlutter();

    /// Check if it's the first time the user opens the app
    final onBoardingBox = await Hive.openBox('onBoarding');
    if (!onBoardingBox.containsKey('isFirstTime')) await onBoardingBox.put('isFirstTime', true);

    final authenticationBox = await Hive.openBox('authentication');
    if (!authenticationBox.containsKey('signedIn')) await authenticationBox.put('signedIn', false);

    /// Set up error handling for Flutter errors
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    /// Initialize Yandex Mapkit
    await initMapkit(apiKey: "8763378b-5106-4666-8a89-33ec2fbd292a");

    /// Initialize Dependencies
    setup();

    /// Run the App
    runApp(const App());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
