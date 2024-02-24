import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
      ),
      home: const SplashPage(),
    );
  }
}
