
import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:oringe/module_change_pass/pass_routes.dart';
import 'package:oringe/module_change_pass/ui/screen/chnage_pass_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePassModule extends YesModule {
  final ChangePassScreen _changePassScreen;
  ChangePassModule(this._changePassScreen) {
    YesModule.RoutesMap.addAll({
      PassRoutes.ROUTE_PASS: (context) => _changePassScreen,
    });
  }
}
