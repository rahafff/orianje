import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:oringe/module_splash/splash_routes.dart';
import 'package:oringe/module_splash/ui/screen/splash_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashModule extends YesModule {
  SplashModule(SplashScreen splashScreen) {
    YesModule.RoutesMap.addAll(
        {SplashRoutes.SPLASH_SCREEN: (context) => splashScreen});
  }
}
