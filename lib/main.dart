import 'package:flutter/material.dart';
import 'package:spotify_clone/ui/dashboard/dashboard_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // routes: AppRoutes.routes,
      // initialRoute: AppRoutes.splash_page,
      home: DashboardScreen(),
    );
  }
}


