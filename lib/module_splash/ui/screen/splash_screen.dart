import 'package:oringe/module_auth/authorization_routes.dart';
import 'package:oringe/module_auth/service/auth_service/auth_service.dart';
import 'package:oringe/module_main_navigation/nav_routes.dart';
import 'package:oringe/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';

@injectable
class SplashScreen extends StatefulWidget {
  final AuthService _authService;
  SplashScreen(this._authService);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Dura) {
       _getNextRoute().then((route) {
         Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
       });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(child:  Container(
          color: Colors.white,
          child: Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(ImageAsset.LOGIN,),
          ))) )
    );
  }

  Future<String> _getNextRoute() async {
    await Future.delayed(Duration(seconds: 3));
    if (widget._authService.isLoggedIn) {
      return NavRoutes.ROUTE_NAV;
    }else{
      return AuthorizationRoutes.LOGIN_SCREEN;
    }
  }
}
