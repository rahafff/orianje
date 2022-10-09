
import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_mails/mail_routes.dart';
import 'package:oringe/module_mails/ui/screen/add_mail_screen.dart';
import 'ui/screen/mail_details_screen.dart';

@injectable
class MailModule extends YesModule {
  final AddMailScreen _addMailScreen;
  final MailDetailsScreen _detailsScreen;
  MailModule(this._addMailScreen, this._detailsScreen) {
    YesModule.RoutesMap.addAll({
      MailRoutes.ADD_MAIL: (context) => _addMailScreen,
      MailRoutes.MAIL_DETAILES: (context) => _detailsScreen,
    });
  }
}
