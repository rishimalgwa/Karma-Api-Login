import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karma_login/pages/home_page.dart';
import 'package:karma_login/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userToken = prefs.getString('userToken');

  runApp(MyApp());
}

String? userToken;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(
        Theme.of(context).textTheme,
      )),
      home: userToken == null ? LoginPage() : HomePage(token: userToken),
    );
  }
}
