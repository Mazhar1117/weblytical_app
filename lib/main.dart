// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/ui/screens/authentication/login_screen.dart';
import 'package:ui/ui/screens/dashboard.dart';
import 'package:ui/ui/screens/diagnostics/diagnostics_screen.dart';
import 'package:ui/ui/screens/profile/profile_screen.dart';
import 'package:ui/ui/screens/register/sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screens/home.dart';
import 'utils/menu_controller.dart';
// import 'package:ui/ui/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuController>(
          create: (context) => MenuController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login",
        // theme: ThemeData(primaryColor: Colors.orange[200]),
        routes: <String, WidgetBuilder>{
          SIGN_IN: (BuildContext context) => LoginScreen(),
          SIGN_UP: (BuildContext context) => SignupScreen(),
          DASHBOARD: (BuildContext context) => const DashBoardScreen(),
          HOME: (BuildContext context) => const Home(),
          PROFILE: (BuildContext context) => ProfileScreen(),
          DIAGNOSTICS: (BuildContext context) => DiagnosticsScreen()
        },
        initialRoute: SIGN_IN,
        // home: PopoverExample(),
      ),
    );
  }
}
