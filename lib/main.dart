import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/ui/screens/dashboard.dart';
import 'package:ui/ui/screens/signin.dart';
import 'package:ui/ui/screens/signup.dart';
import 'package:provider/provider.dart';

import 'ui/screens/home.dart';
import 'utils/menu_controller.dart';
// import 'package:ui/ui/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          SIGN_IN: (BuildContext context) =>  const SignInPage(),
          SIGN_UP: (BuildContext context) =>  const SignUpScreen(),
          DASHBOARD: (BuildContext context) =>  const DashBoardScreen(),
          HOME: (BuildContext context) => const Home(),
        },
        initialRoute: SIGN_IN,
       
      ),
    );
  }
}



