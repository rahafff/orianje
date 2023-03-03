// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i60;
import '../module_auth/authoriazation_module.dart' as _i51;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i15;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i13;
import '../module_auth/service/auth_service/auth_service.dart' as _i16;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i22;
import '../module_auth/state_manager/login_state_manager/signup_state_manager.dart'
    as _i33;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i41;
import '../module_auth/ui/screen/login_screen/signup_screen.dart' as _i47;
import '../module_change_pass/manager/change_pass_manager.dart' as _i31;
import '../module_change_pass/pass_module.dart' as _i58;
import '../module_change_pass/repository/chnage_pass_repo.dart' as _i17;
import '../module_change_pass/service/change_pass_service.dart' as _i32;
import '../module_change_pass/state_manager/chnage_pass_state_manager.dart'
    as _i36;
import '../module_change_pass/ui/screen/chnage_pass_screen.dart' as _i52;
import '../module_emploees/employee_module.dart' as _i59;
import '../module_emploees/repository/employees_repository.dart' as _i18;
import '../module_emploees/service/employee_service.dart' as _i37;
import '../module_emploees/state_manager/emplo_state_manager.dart' as _i38;
import '../module_emploees/ui/screen/add_employe.dart' as _i49;
import '../module_emploees/ui/screen/emp_record_screen.dart' as _i53;
import '../module_emploees/ui/screen/employees_screen.dart' as _i39;
import '../module_invoices/invoice_module.dart' as _i55;
import '../module_invoices/repository/invoice_repository.dart' as _i20;
import '../module_invoices/service/invoice_service.dart' as _i21;
import '../module_invoices/state_manager/invoice_state_manager.dart' as _i40;
import '../module_invoices/ui/screen/add_invoice_screen.dart' as _i50;
import '../module_invoices/ui/screen/invoice_details_screen.dart' as _i54;
import '../module_invoices/ui/screen/invoices_screen.dart' as _i56;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_mails/mail_module.dart' as _i43;
import '../module_mails/repository/mails_repository.dart' as _i23;
import '../module_mails/service/mail_service.dart' as _i24;
import '../module_mails/state_manager/mails_state_manager.dart' as _i25;
import '../module_mails/ui/screen/add_mail_screen.dart' as _i35;
import '../module_mails/ui/screen/mail_details_screen.dart' as _i42;
import '../module_mails/ui/screen/mails_list_screen.dart' as _i44;
import '../module_main_navigation/nav_module.dart' as _i30;
import '../module_main_navigation/ui/botto_nav_screen.dart' as _i26;
import '../module_main_navigation/ui/company_info.dart' as _i4;
import '../module_messages/messages_module.dart' as _i57;
import '../module_messages/repository/msg_repository.dart' as _i27;
import '../module_messages/service/msg_service.dart' as _i28;
import '../module_messages/state_manager/mails_state_manager.dart' as _i29;
import '../module_messages/ui/messages_screen.dart' as _i46;
import '../module_messages/ui/msg_details_screen.dart' as _i45;
import '../module_network/http_client/http_client.dart' as _i11;
import '../module_splash/splash_module.dart' as _i48;
import '../module_splash/ui/screen/splash_screen.dart' as _i34;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i9;
import '../module_theme/service/theme_service/theme_service.dart' as _i12;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i14;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i10;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i19;
import '../utils/global/global_state_manager.dart' as _i5;
import '../utils/logger/logger.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.CompanyInfo>(() => _i4.CompanyInfo());
  gh.singleton<_i5.GlobalStateManager>(_i5.GlobalStateManager());
  gh.factory<_i6.LocalizationPreferencesHelper>(
      () => _i6.LocalizationPreferencesHelper());
  gh.factory<_i7.LocalizationService>(
      () => _i7.LocalizationService(get<_i6.LocalizationPreferencesHelper>()));
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.ThemePreferencesHelper>(() => _i9.ThemePreferencesHelper());
  gh.factory<_i10.UploadRepository>(() => _i10.UploadRepository());
  gh.factory<_i11.ApiClient>(() => _i11.ApiClient(get<_i8.Logger>()));
  gh.factory<_i12.AppThemeDataService>(
      () => _i12.AppThemeDataService(get<_i9.ThemePreferencesHelper>()));
  gh.factory<_i13.AuthRepository>(
      () => _i13.AuthRepository(get<_i11.ApiClient>(), get<_i8.Logger>()));
  gh.factory<_i14.UploadManager>(
      () => _i14.UploadManager(get<_i10.UploadRepository>()));
  gh.factory<_i15.AuthManager>(
      () => _i15.AuthManager(get<_i13.AuthRepository>()));
  gh.factory<_i16.AuthService>(() =>
      _i16.AuthService(get<_i3.AuthPrefsHelper>(), get<_i15.AuthManager>()));
  gh.factory<_i17.ChangePassRepository>(() => _i17.ChangePassRepository(
      get<_i11.ApiClient>(), get<_i16.AuthService>()));
  gh.factory<_i18.EmployeesRepository>(() =>
      _i18.EmployeesRepository(get<_i11.ApiClient>(), get<_i16.AuthService>()));
  gh.factory<_i19.ImageUploadService>(
      () => _i19.ImageUploadService(get<_i14.UploadManager>()));
  gh.factory<_i20.InvoiceRepository>(() =>
      _i20.InvoiceRepository(get<_i11.ApiClient>(), get<_i16.AuthService>()));
  gh.factory<_i21.InvoicesService>(
      () => _i21.InvoicesService(get<_i20.InvoiceRepository>()));
  gh.factory<_i22.LoginStateManager>(
      () => _i22.LoginStateManager(get<_i16.AuthService>()));
  gh.factory<_i23.MailsRepository>(() =>
      _i23.MailsRepository(get<_i11.ApiClient>(), get<_i16.AuthService>()));
  gh.factory<_i24.MailsService>(
      () => _i24.MailsService(get<_i23.MailsRepository>()));
  gh.factory<_i25.MailsStateManager>(() => _i25.MailsStateManager(
      get<_i24.MailsService>(), get<_i19.ImageUploadService>()));
  gh.factory<_i26.MainNavigation>(() => _i26.MainNavigation(
      get<_i7.LocalizationService>(), get<_i16.AuthService>()));
  gh.factory<_i27.MsgRepository>(
      () => _i27.MsgRepository(get<_i11.ApiClient>(), get<_i16.AuthService>()));
  gh.factory<_i28.MsgService>(() => _i28.MsgService(get<_i27.MsgRepository>()));
  gh.factory<_i29.MsgStateManager>(
      () => _i29.MsgStateManager(get<_i28.MsgService>()));
  gh.factory<_i30.NavigationModule>(() => _i30.NavigationModule(
      get<_i26.MainNavigation>(), get<_i4.CompanyInfo>()));
  gh.factory<_i31.PasswordManager>(
      () => _i31.PasswordManager(get<_i17.ChangePassRepository>()));
  gh.factory<_i32.PasswordService>(
      () => _i32.PasswordService(get<_i31.PasswordManager>()));
  gh.factory<_i33.SignUpStateManager>(
      () => _i33.SignUpStateManager(get<_i16.AuthService>()));
  gh.factory<_i34.SplashScreen>(
      () => _i34.SplashScreen(get<_i16.AuthService>()));
  gh.factory<_i35.AddMailScreen>(
      () => _i35.AddMailScreen(get<_i25.MailsStateManager>()));
  gh.factory<_i36.ChangePassStateManager>(() => _i36.ChangePassStateManager(
      get<_i16.AuthService>(), get<_i32.PasswordService>()));
  gh.factory<_i37.EmployeeService>(
      () => _i37.EmployeeService(get<_i18.EmployeesRepository>()));
  gh.factory<_i38.EmployeeStateManager>(
      () => _i38.EmployeeStateManager(get<_i37.EmployeeService>()));
  gh.factory<_i39.EmployeesScreen>(
      () => _i39.EmployeesScreen(get<_i38.EmployeeStateManager>()));
  gh.factory<_i40.InvoiceStateManager>(() => _i40.InvoiceStateManager(
      get<_i21.InvoicesService>(), get<_i19.ImageUploadService>()));
  gh.factory<_i41.LoginScreen>(
      () => _i41.LoginScreen(get<_i22.LoginStateManager>()));
  gh.factory<_i42.MailDetailsScreen>(
      () => _i42.MailDetailsScreen(get<_i25.MailsStateManager>()));
  gh.factory<_i43.MailModule>(() => _i43.MailModule(
      get<_i35.AddMailScreen>(), get<_i42.MailDetailsScreen>()));
  gh.factory<_i44.MailsListScreen>(
      () => _i44.MailsListScreen(get<_i25.MailsStateManager>()));
  gh.factory<_i45.MsgDetailsScreen>(
      () => _i45.MsgDetailsScreen(get<_i29.MsgStateManager>()));
  gh.factory<_i46.MsgScreen>(() => _i46.MsgScreen(get<_i29.MsgStateManager>()));
  gh.factory<_i47.SignUpScreen>(
      () => _i47.SignUpScreen(get<_i33.SignUpStateManager>()));
  gh.factory<_i48.SplashModule>(
      () => _i48.SplashModule(get<_i34.SplashScreen>()));
  gh.factory<_i49.AddEmployeeScreen>(
      () => _i49.AddEmployeeScreen(get<_i38.EmployeeStateManager>()));
  gh.factory<_i50.AddInvoiceScreen>(
      () => _i50.AddInvoiceScreen(get<_i40.InvoiceStateManager>()));
  gh.factory<_i51.AuthorizationModule>(() => _i51.AuthorizationModule(
      get<_i41.LoginScreen>(), get<_i47.SignUpScreen>()));
  gh.factory<_i52.ChangePassScreen>(
      () => _i52.ChangePassScreen(get<_i36.ChangePassStateManager>()));
  gh.factory<_i53.EmployeeRecordScreen>(
      () => _i53.EmployeeRecordScreen(get<_i38.EmployeeStateManager>()));
  gh.factory<_i54.InvoiceDetailsScreen>(
      () => _i54.InvoiceDetailsScreen(get<_i40.InvoiceStateManager>()));
  gh.factory<_i55.InvoiceModule>(() => _i55.InvoiceModule(
      get<_i50.AddInvoiceScreen>(), get<_i54.InvoiceDetailsScreen>()));
  gh.factory<_i56.InvoiceScreen>(
      () => _i56.InvoiceScreen(get<_i40.InvoiceStateManager>()));
  gh.factory<_i57.MessageModule>(() =>
      _i57.MessageModule(get<_i46.MsgScreen>(), get<_i45.MsgDetailsScreen>()));
  gh.factory<_i58.ChangePassModule>(
      () => _i58.ChangePassModule(get<_i52.ChangePassScreen>()));
  gh.factory<_i59.EmployeeModule>(() => _i59.EmployeeModule(
      get<_i49.AddEmployeeScreen>(),
      get<_i39.EmployeesScreen>(),
      get<_i53.EmployeeRecordScreen>()));
  gh.factory<_i60.MyApp>(() => _i60.MyApp(
      get<_i12.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i48.SplashModule>(),
      get<_i51.AuthorizationModule>(),
      get<_i30.NavigationModule>(),
      get<_i58.ChangePassModule>(),
      get<_i55.InvoiceModule>(),
      get<_i43.MailModule>(),
      get<_i57.MessageModule>(),
      get<_i59.EmployeeModule>()));
  return get;
}
