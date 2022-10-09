
import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:oringe/module_main_navigation/nav_routes.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_main_navigation/ui/company_info.dart';

import 'ui/botto_nav_screen.dart';

@injectable
class NavigationModule extends YesModule {
  final MainNavigation navigation;
  final CompanyInfo _companyInfo;
  NavigationModule(this.navigation , this._companyInfo) {
    YesModule.RoutesMap.addAll({
      NavRoutes.ROUTE_NAV: (context) => navigation,
      NavRoutes.COMPANY_INFO: (context) => _companyInfo,
    });
  }
}
