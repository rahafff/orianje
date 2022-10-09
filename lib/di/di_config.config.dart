// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i59;
import '../module_auth/authoriazation_module.dart' as _i50;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i16;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i14;
import '../module_auth/service/auth_service/auth_service.dart' as _i17;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i23;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i41;
import '../module_change_pass/manager/change_pass_manager.dart' as _i32;
import '../module_change_pass/pass_module.dart' as _i57;
import '../module_change_pass/repository/chnage_pass_repo.dart' as _i18;
import '../module_change_pass/service/change_pass_service.dart' as _i33;
import '../module_change_pass/state_manager/chnage_pass_state_manager.dart'
    as _i36;
import '../module_change_pass/ui/screen/chnage_pass_screen.dart' as _i51;
import '../module_emploees/employee_module.dart' as _i58;
import '../module_emploees/repository/employees_repository.dart' as _i19;
import '../module_emploees/service/employee_service.dart' as _i37;
import '../module_emploees/state_manager/emplo_state_manager.dart' as _i38;
import '../module_emploees/ui/screen/add_employe.dart' as _i48;
import '../module_emploees/ui/screen/emp_record_screen.dart' as _i52;
import '../module_emploees/ui/screen/employees_screen.dart' as _i39;
import '../module_invoices/invoice_module.dart' as _i54;
import '../module_invoices/repository/invoice_repository.dart' as _i21;
import '../module_invoices/service/invoice_service.dart' as _i22;
import '../module_invoices/state_manager/invoice_state_manager.dart' as _i40;
import '../module_invoices/ui/admin_invoices_screen.dart' as _i3;
import '../module_invoices/ui/screen/add_invoice_screen.dart' as _i49;
import '../module_invoices/ui/screen/invoice_details_screen.dart' as _i53;
import '../module_invoices/ui/screen/invoices_screen.dart' as _i55;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i7;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i8;
import '../module_mails/mail_module.dart' as _i43;
import '../module_mails/repository/mails_repository.dart' as _i24;
import '../module_mails/service/mail_service.dart' as _i25;
import '../module_mails/state_manager/mails_state_manager.dart' as _i26;
import '../module_mails/ui/screen/add_mail_screen.dart' as _i35;
import '../module_mails/ui/screen/mail_details_screen.dart' as _i42;
import '../module_mails/ui/screen/mails_list_screen.dart' as _i44;
import '../module_main_navigation/nav_module.dart' as _i31;
import '../module_main_navigation/ui/botto_nav_screen.dart' as _i27;
import '../module_main_navigation/ui/company_info.dart' as _i5;
import '../module_messages/messages_module.dart' as _i56;
import '../module_messages/repository/msg_repository.dart' as _i28;
import '../module_messages/service/msg_service.dart' as _i29;
import '../module_messages/state_manager/mails_state_manager.dart' as _i30;
import '../module_messages/ui/messages_screen.dart' as _i46;
import '../module_messages/ui/msg_details_screen.dart' as _i45;
import '../module_network/http_client/http_client.dart' as _i12;
import '../module_splash/splash_module.dart' as _i47;
import '../module_splash/ui/screen/splash_screen.dart' as _i34;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i10;
import '../module_theme/service/theme_service/theme_service.dart' as _i13;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i15;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i11;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i20;
import '../utils/global/global_state_manager.dart' as _i6;
import '../utils/logger/logger.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AdminInvoiceScreen>(() => _i3.AdminInvoiceScreen());
  gh.factory<_i4.AuthPrefsHelper>(() => _i4.AuthPrefsHelper());
  gh.factory<_i5.CompanyInfo>(() => _i5.CompanyInfo());
  gh.singleton<_i6.GlobalStateManager>(_i6.GlobalStateManager());
  gh.factory<_i7.LocalizationPreferencesHelper>(
      () => _i7.LocalizationPreferencesHelper());
  gh.factory<_i8.LocalizationService>(
      () => _i8.LocalizationService(get<_i7.LocalizationPreferencesHelper>()));
  gh.factory<_i9.Logger>(() => _i9.Logger());
  gh.factory<_i10.ThemePreferencesHelper>(() => _i10.ThemePreferencesHelper());
  gh.factory<_i11.UploadRepository>(() => _i11.UploadRepository());
  gh.factory<_i12.ApiClient>(() => _i12.ApiClient(get<_i9.Logger>()));
  gh.factory<_i13.AppThemeDataService>(
      () => _i13.AppThemeDataService(get<_i10.ThemePreferencesHelper>()));
  gh.factory<_i14.AuthRepository>(
      () => _i14.AuthRepository(get<_i12.ApiClient>(), get<_i9.Logger>()));
  gh.factory<_i15.UploadManager>(
      () => _i15.UploadManager(get<_i11.UploadRepository>()));
  gh.factory<_i16.AuthManager>(
      () => _i16.AuthManager(get<_i14.AuthRepository>()));
  gh.factory<_i17.AuthService>(() =>
      _i17.AuthService(get<_i4.AuthPrefsHelper>(), get<_i16.AuthManager>()));
  gh.factory<_i18.ChangePassRepository>(() => _i18.ChangePassRepository(
      get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i19.EmployeesRepository>(() =>
      _i19.EmployeesRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i20.ImageUploadService>(
      () => _i20.ImageUploadService(get<_i15.UploadManager>()));
  gh.factory<_i21.InvoiceRepository>(() =>
      _i21.InvoiceRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i22.InvoicesService>(
      () => _i22.InvoicesService(get<_i21.InvoiceRepository>()));
  gh.factory<_i23.LoginStateManager>(
      () => _i23.LoginStateManager(get<_i17.AuthService>()));
  gh.factory<_i24.MailsRepository>(() =>
      _i24.MailsRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i25.MailsService>(
      () => _i25.MailsService(get<_i24.MailsRepository>()));
  gh.factory<_i26.MailsStateManager>(() => _i26.MailsStateManager(
      get<_i25.MailsService>(), get<_i20.ImageUploadService>()));
  gh.factory<_i27.MainNavigation>(() => _i27.MainNavigation(
      get<_i8.LocalizationService>(), get<_i17.AuthService>()));
  gh.factory<_i28.MsgRepository>(
      () => _i28.MsgRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i29.MsgService>(() => _i29.MsgService(get<_i28.MsgRepository>()));
  gh.factory<_i30.MsgStateManager>(
      () => _i30.MsgStateManager(get<_i29.MsgService>()));
  gh.factory<_i31.NavigationModule>(() => _i31.NavigationModule(
      get<_i27.MainNavigation>(), get<_i5.CompanyInfo>()));
  gh.factory<_i32.PasswordManager>(
      () => _i32.PasswordManager(get<_i18.ChangePassRepository>()));
  gh.factory<_i33.PasswordService>(
      () => _i33.PasswordService(get<_i32.PasswordManager>()));
  gh.factory<_i34.SplashScreen>(
      () => _i34.SplashScreen(get<_i17.AuthService>()));
  gh.factory<_i35.AddMailScreen>(
      () => _i35.AddMailScreen(get<_i26.MailsStateManager>()));
  gh.factory<_i36.ChangePassStateManager>(() => _i36.ChangePassStateManager(
      get<_i17.AuthService>(), get<_i33.PasswordService>()));
  gh.factory<_i37.EmployeeService>(
      () => _i37.EmployeeService(get<_i19.EmployeesRepository>()));
  gh.factory<_i38.EmployeeStateManager>(
      () => _i38.EmployeeStateManager(get<_i37.EmployeeService>()));
  gh.factory<_i39.EmployeesScreen>(
      () => _i39.EmployeesScreen(get<_i38.EmployeeStateManager>()));
  gh.factory<_i40.InvoiceStateManager>(() => _i40.InvoiceStateManager(
      get<_i22.InvoicesService>(), get<_i20.ImageUploadService>()));
  gh.factory<_i41.LoginScreen>(
      () => _i41.LoginScreen(get<_i23.LoginStateManager>()));
  gh.factory<_i42.MailDetailsScreen>(
      () => _i42.MailDetailsScreen(get<_i26.MailsStateManager>()));
  gh.factory<_i43.MailModule>(() => _i43.MailModule(
      get<_i35.AddMailScreen>(), get<_i42.MailDetailsScreen>()));
  gh.factory<_i44.MailsListScreen>(
      () => _i44.MailsListScreen(get<_i26.MailsStateManager>()));
  gh.factory<_i45.MsgDetailsScreen>(
      () => _i45.MsgDetailsScreen(get<_i30.MsgStateManager>()));
  gh.factory<_i46.MsgScreen>(() => _i46.MsgScreen(get<_i30.MsgStateManager>()));
  gh.factory<_i47.SplashModule>(
      () => _i47.SplashModule(get<_i34.SplashScreen>()));
  gh.factory<_i48.AddEmployeeScreen>(
      () => _i48.AddEmployeeScreen(get<_i38.EmployeeStateManager>()));
  gh.factory<_i49.AddInvoiceScreen>(
      () => _i49.AddInvoiceScreen(get<_i40.InvoiceStateManager>()));
  gh.factory<_i50.AuthorizationModule>(
      () => _i50.AuthorizationModule(get<_i41.LoginScreen>()));
  gh.factory<_i51.ChangePassScreen>(
      () => _i51.ChangePassScreen(get<_i36.ChangePassStateManager>()));
  gh.factory<_i52.EmployeeRecordScreen>(
      () => _i52.EmployeeRecordScreen(get<_i38.EmployeeStateManager>()));
  gh.factory<_i53.InvoiceDetailsScreen>(
      () => _i53.InvoiceDetailsScreen(get<_i40.InvoiceStateManager>()));
  gh.factory<_i54.InvoiceModule>(() => _i54.InvoiceModule(
      get<_i49.AddInvoiceScreen>(), get<_i53.InvoiceDetailsScreen>()));
  gh.factory<_i55.InvoiceScreen>(
      () => _i55.InvoiceScreen(get<_i40.InvoiceStateManager>()));
  gh.factory<_i56.MessageModule>(() =>
      _i56.MessageModule(get<_i46.MsgScreen>(), get<_i45.MsgDetailsScreen>()));
  gh.factory<_i57.ChangePassModule>(
      () => _i57.ChangePassModule(get<_i51.ChangePassScreen>()));
  gh.factory<_i58.EmployeeModule>(() => _i58.EmployeeModule(
      get<_i48.AddEmployeeScreen>(),
      get<_i39.EmployeesScreen>(),
      get<_i52.EmployeeRecordScreen>()));
  gh.factory<_i59.MyApp>(() => _i59.MyApp(
      get<_i13.AppThemeDataService>(),
      get<_i8.LocalizationService>(),
      get<_i47.SplashModule>(),
      get<_i50.AuthorizationModule>(),
      get<_i31.NavigationModule>(),
      get<_i57.ChangePassModule>(),
      get<_i54.InvoiceModule>(),
      get<_i43.MailModule>(),
      get<_i56.MessageModule>(),
      get<_i58.EmployeeModule>()));
  return get;
}
