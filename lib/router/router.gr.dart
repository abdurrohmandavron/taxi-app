// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:yollararo/presentations/screens/home/home_screen.dart' as _i2;
import 'package:yollararo/presentations/screens/onboarding/onboarding.dart' as _i3;
import 'package:yollararo/presentations/screens/splash/splash.dart' as _i1;

/// generated route for
/// [_i1.AnimatedSplashScreen]
class AnimatedSplashRoute extends _i4.PageRouteInfo<void> {
  const AnimatedSplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AnimatedSplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimatedSplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AnimatedSplashScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.OnBoardingScreen]
class OnBoardingRoute extends _i4.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i4.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnBoardingScreen();
    },
  );
}
