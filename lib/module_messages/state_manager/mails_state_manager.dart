import 'package:injectable/injectable.dart';
import 'package:oringe/abstracts/states/loading_state.dart';
import 'package:oringe/abstracts/states/state.dart';
import 'package:oringe/module_messages/model/msg_model.dart';
import 'package:oringe/module_messages/service/msg_service.dart';
import 'package:oringe/module_messages/ui/messages_screen.dart';
import 'package:oringe/module_messages/ui/states/msg_success_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class MsgStateManager {
  final MsgService _service;

  final PublishSubject<States> stateSubject = PublishSubject();
  Stream<States> get stateStream => stateSubject.stream;

  MsgStateManager(
    this._service,
  );

  Future<void> getMsg(MsgScreenState screenState) async {
   stateSubject.add(LoadingState(screenState));
    var invoiceResult = await _service.getMsg();
    if (invoiceResult.hasError) {
     stateSubject.add(
          MsgStateSuccess(screenState, msg: null, error: invoiceResult.error));
    } else if (invoiceResult.isEmpty) {
      stateSubject.add(MsgStateSuccess(screenState, msg: null, empty: true));
    } else {
      invoiceResult as MsgResultModel;
      stateSubject
          .add(MsgStateSuccess(screenState, msg: invoiceResult.data?.mails));
    }
  }
}
