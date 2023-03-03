import 'package:badges/badges.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:oringe/di/di_config.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:oringe/module_auth/authorization_routes.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_change_pass/pass_routes.dart';
import 'package:oringe/module_main_navigation/nav_routes.dart';
import 'package:oringe/module_messages/ui/messages_screen.dart';
import 'package:oringe/utils/components/custom_alert_dialog.dart';
import '../../module_emploees/ui/screen/employees_screen.dart';
import 'package:oringe/module_invoices/invoice_routes.dart';
import '../../module_invoices/ui/screen/invoices_screen.dart';
import 'package:oringe/module_localization/service/localization_service/localization_service.dart';
import 'package:oringe/module_mails/mail_routes.dart';
import '../../module_mails/ui/screen/mails_list_screen.dart';
import 'package:oringe/utils/images/images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../module_invoices/widget/clipper.dart';

@injectable
class MainNavigation extends StatefulWidget {
 final LocalizationService _service;
  final AuthService _authService;

  MainNavigation(this._service, this._authService);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedPage = 0;
  PageController homeController = PageController(initialPage: 0);
  bool flagPageIndex = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: selectedPage == 0
            ? AppBar(
                backgroundColor: Colors.grey.shade200,
                surfaceTintColor: Colors.grey.shade200,
                centerTitle: true,
                elevation: 5,
                title: Text(S.of(context).invoices,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, InvoiceRoutes.ADD_INVOICE);
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 30),
                      child: Icon(
                        Icons.add_circle,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            : (selectedPage == 1
                ? AppBar(
                    backgroundColor: Colors.grey.shade200,
                    surfaceTintColor: Colors.grey.shade200,
                    centerTitle: true,
                    elevation: 5,
                    title: Text(S.of(context).mails,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    actions: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MailRoutes.ADD_MAIL);
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 30),
                          child: Icon(
                            Icons.add_circle,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  )
                : selectedPage == 2
                    ? AppBar(
                        backgroundColor: Colors.grey.shade200,
                        surfaceTintColor: Colors.grey.shade200,
                        centerTitle: true,
                        elevation: 5,
                        title: Text(S.of(context).employees,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    : AppBar(
                        backgroundColor: Colors.grey.shade200,
                        surfaceTintColor: Colors.grey.shade200,
                        centerTitle: true,
                        elevation: 5,
                        title: Text(S.of(context).inbox,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
        bottomNavigationBar: CustomNavigationBar(
            items: [
              CustomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.fileInvoice),
                  title: Text(S.of(context).invoices)),
              CustomNavigationBarItem(
                  icon: Icon(Icons.mail), title: Text(S.of(context).mails)),
              CustomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text(S.of(context).employees)),
              CustomNavigationBarItem(
                  icon: Icon(Icons.assignment_returned),
                  title: Text(S.of(context).inbox)),
            ],
//        backgroundColor: Theme.of(context).cardColor,
            onTap: (int index) {
              selectedPage = index;
              homeController.animateToPage(index,
                  duration: Duration(milliseconds: 15), curve: Curves.linear);
            },
            currentIndex: selectedPage,
            selectedColor: Theme.of(context).primaryColor,
            elevation: 5,
            borderRadius: Radius.circular(25)),
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Stack(
                        children: [
                          Clipper(
                            child: Container(
                              alignment: Alignment.center,
                              color: Theme.of(context).primaryColor,
                              height: 200,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 100),
                            child: Container(
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(180),
                                child: Image(
                                  image: AssetImage(ImageAsset.LOGO),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PassRoutes.ROUTE_PASS);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                child: Icon(
                              Icons.password_rounded,
                            )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                S.of(context).changePass,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            S.of(context).language,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          DropdownButton(
                              dropdownColor: Theme.of(context).primaryColor,
                              value:
                                  Localizations.localeOf(context).languageCode,
                              style: TextStyle(color: Colors.white),
                              underline: Container(),
                              icon: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.arrow_drop_down_rounded,
                                    color: Theme.of(context).primaryColor),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    'العربية',
                                    style: TextStyle(),
                                  ),
                                  value: 'ar',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'English',
                                    style: TextStyle(),
                                  ),
                                  value: 'en',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'Dutch',
                                    style: TextStyle(),
                                  ),
                                  value: 'nl',
                                ),
                              ],
                              onChanged: (newLang) {
                                widget._service.setLanguage(newLang.toString());
                              })
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((context) => CustomDialogBox(
                                  title:  S.of(context).appLockMessg,
                                )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.userSecret,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                S.of(context).appLock,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, NavRoutes.COMPANY_INFO);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.infoCircle,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                S.of(context).companyInfo,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget._authService.logout().then((value) {
                          Navigator.pushNamedAndRemoveUntil(context, AuthorizationRoutes.LOGIN_SCREEN, (route) => false,arguments: false);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.signOutAlt,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                S.of(context).signOut,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//            Spacer(),
              Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Column(
                    children: [
                      Divider(
                        height: 2,
                        thickness: 2,
                      ),
                      ListTile(
                        title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Powered by ",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                            TextSpan(
                                text: "Tello Technology",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    if (await canLaunch(
                                            "https://Tellotech.eu") ==
                                        true) {
                                      launch("https://Tellotech.eu");
                                    } else {
                                      print("Can't launch URL");
                                    }
                                  }),
                          ]),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: homeController,
            onPageChanged: (index) {
              setState(() => selectedPage = index);
            },
            children: <Widget>[
              getIt<InvoiceScreen>(),
              getIt<MailsListScreen>(),
              getIt<EmployeesScreen>(),
              getIt<MsgScreen>(),
            ],
          ),
        ));
  }
}
