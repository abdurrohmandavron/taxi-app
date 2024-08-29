import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yandex_maps_mapkit/init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'app.dart';
import 'services/get_it.dart';
import 'firebase_options.dart';

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
    await dotenv.load();
    await initMapkit(apiKey: dotenv.env['MAP_API_KEY']!);

    /// Initialize Dependencies
    setup();

    /// Run the App
    runApp(App());
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
