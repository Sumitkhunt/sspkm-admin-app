import 'package:admin/screen/home.dart';
import 'package:admin/screen/login.dart';
import 'package:admin/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'all_form_details/all_form.dart';
import 'event/add_photo.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        // theme: ThemeData(brightness: Brightness.light),
        // darkTheme: ThemeData(brightness: Brightness.dark),
        //  themeMode: ThemeMode.system,
        title: "sspkm admin",
        home: splash_screen(),
        debugShowCheckedModeBanner: false,
      );
    }
    );
  }
}