import 'package:flutter/material.dart';

import 'Services/notifi_service.dart';
import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //NotificationService().initNotification();
  NotificationHelper.init();
  //tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Notifications App',
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      home: const MyHomePage(),
    );
  }
}
