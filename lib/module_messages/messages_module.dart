import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_messages/message_routes.dart';
import 'package:oringe/module_messages/ui/messages_screen.dart';
import 'package:oringe/module_messages/ui/msg_details_screen.dart';

@injectable
class MessageModule extends YesModule {
  final MsgScreen _messagesScreen;
  final MsgDetailsScreen _detailsScreen;

  MessageModule(this._messagesScreen , this._detailsScreen) {
    YesModule.RoutesMap.addAll({
      MessageRoutes.VIEW_MESSAGE: (context) => _messagesScreen,
      MessageRoutes.DETAILS_SCREEN: (context) => _detailsScreen,
    });
  }
}
