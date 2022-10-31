import 'dart:async';
import 'package:oringe/abstracts/module/yes_module.dart';
import 'package:oringe/di/di_config.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/global_nav_key.dart';
import 'package:oringe/hive/hive_init.dart';
import 'package:oringe/module_auth/authoriazation_module.dart';
import 'package:oringe/module_emploees/employee_module.dart';
import 'package:oringe/module_invoices/invoice_module.dart';
import 'package:oringe/module_localization/service/localization_service/localization_service.dart';
import 'package:oringe/module_mails/mail_module.dart';
import 'package:oringe/module_main_navigation/nav_module.dart';
import 'package:oringe/module_messages/messages_module.dart';
import 'package:oringe/module_splash/splash_module.dart';
import 'package:oringe/module_splash/splash_routes.dart';
import 'package:oringe/module_theme/service/theme_service/theme_service.dart';
import 'package:oringe/utils/global/global_state_manager.dart';
import 'package:oringe/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:lehttp_overrides/lehttp_overrides.dart';
import 'package:device_info/device_info.dart';
import 'dart:io' as p;
import 'package:simple_moment/simple_moment.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'module_change_pass/pass_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  timeago.setLocaleMessages('ar', timeago.ArMessages());
//  timeago.setLocaleMessages('en', timeago.EnMessages());
  if (!kIsWeb) {
    if (p.Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt < 26) {
        p.HttpOverrides.global = LEHttpOverrides();
      }
    }
  }
  await HiveSetUp.init();
  // await Firebase.initializeApp();
  if (kIsWeb) {
  } else {
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = (FlutterErrorDetails details) {
    //   FirebaseCrashlytics.instance.recordFlutterError(details);
    // };
  }
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    await runZonedGuarded(() {
      configureDependencies();
      // Your App Here
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      new Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;
  final LocalizationService _localizationService;
  // final FireNotificationService _fireNotificationService;
//  final LocalNotificationService _localNotificationService;
  final SplashModule _splashModule;
  final AuthorizationModule _authorizationModule;
  // final SettingsModule _settingsModule;
  final NavigationModule _navigationModule;
  final ChangePassModule _changePassModule;
  final InvoiceModule _invoiceModule;
  final MailModule _mailModule;
  final MessageModule _messageModule;
  final EmployeeModule _employeeModule;

  MyApp(
      this._themeDataService,
      this._localizationService,
      // this._fireNotificationService,
//      this._localNotificationService,
      this._splashModule,
      this._authorizationModule,
//      this._chatModule,
//       this._settingsModule,
      this._navigationModule,
      this._changePassModule,
      this._invoiceModule,
      this._mailModule,
      this._messageModule,
      this._employeeModule
      );

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // static FirebaseAnalytics analytics = FirebaseAnalytics();
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);
  late String lang;
  late ThemeData activeTheme;
  bool authorized = false;

  @override
  void initState() {
    super.initState();
    lang = widget._localizationService.getLanguage();
    activeTheme = widget._themeDataService.getActiveTheme();
//    timeago.setDefaultLocale(lang);
//    Moment.setLocaleGlobally(lang == 'en' ? LocaleEn() : LocaleAr());
//     widget._fireNotificationService.init();
//    widget._localNotificationService.init();
    widget._localizationService.localizationStream.listen((event) {
//      timeago.setDefaultLocale(event);
      Moment.setLocaleGlobally(event == 'en' ? LocaleEn() : LocaleAr());
      lang = event;
      setState(() {});
    });
//    widget._fireNotificationService.onNotificationStream.listen((event) {
//      widget._localNotificationService.showNotification(event);
//    });
//    widget._localNotificationService.onLocalNotificationStream
//        .listen((event) {});
    getIt<GlobalStateManager>().stateStream.listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(YesModule.RoutesMap);
  }

  Widget getConfiguredApp(
    Map<String, WidgetBuilder> fullRoutesList,
  ) {
    return MaterialApp(
//      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      // navigatorObservers: <NavigatorObserver>[observer],
      navigatorKey: GlobalVariable.navState,
      locale: Locale.fromSubtags(
        languageCode: lang,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: activeTheme,
      supportedLocales: S.delegate.supportedLocales,
      title: 'System contorll',
      routes: fullRoutesList,
      initialRoute: SplashRoutes.SPLASH_SCREEN,
    );
  }
}
