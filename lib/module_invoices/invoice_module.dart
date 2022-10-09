
import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:injectable/injectable.dart';
import 'package:oringe/module_invoices/invoice_routes.dart';
import 'ui/screen/add_invoice_screen.dart';
import 'ui/screen/invoice_details_screen.dart';

@injectable
class InvoiceModule extends YesModule {
  final AddInvoiceScreen _addInvoiceScreen;
  final InvoiceDetailsScreen _detailsScreen;
  InvoiceModule(this._addInvoiceScreen, this._detailsScreen) {
    YesModule.RoutesMap.addAll({
      InvoiceRoutes.ADD_INVOICE: (context) => _addInvoiceScreen,
      InvoiceRoutes.INVOICE_DETAILES: (context) => _detailsScreen,
    });
  }
}
