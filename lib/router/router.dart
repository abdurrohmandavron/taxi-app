import 'package:auto_route/auto_route.dart';
import 'package:yollararo/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: AnimatedSplashRoute.page, initial: true),
      AutoRoute(page: OnBoardingRoute.page),
      AutoRoute(page: SigninRoute.page),
      AutoRoute(page: VerificationRoute.page),
      AutoRoute(page: HomeRoute.page),
    ];
  }
}
