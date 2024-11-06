import 'package:flutter/material.dart';
import 'package:machietaskcodexes/ui/views/home/home_view.dart';
import 'package:machietaskcodexes/ui/views/login/login_view.dart';
import 'package:machietaskcodexes/ui/views/login/login_viewmodel.dart';
import 'package:machietaskcodexes/ui/views/profile/profile_view.dart';
import 'package:machietaskcodexes/ui/views/profile/profile_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),

        // Add other view models here
      ],
      child:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileView(),
      },
    );
  }
}
