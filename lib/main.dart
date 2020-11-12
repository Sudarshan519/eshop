import 'package:eshop/admin/admin.dart';
import 'package:eshop/pages/home.dart';
import 'package:eshop/pages/login.dart';
import 'package:eshop/pages/signup.dart';
import 'package:eshop/pages/splash.dart';
import 'package:eshop/provider/multiProvider.dart';
import 'package:eshop/provider/userProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

 

    switch (user.status) {
      case Status.Uninitialized:
        return Splash();

      case Status.Authenticating:
      case Status.Unauthenticated:
        return Login();
      case Status.Authenticated:
        return MyHomePage();
      default:
        return Login();
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      // ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      // ChangeNotifierProvider.value(value: AppProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: ScreenController(),
    ),
  ));
}
