import 'package:flutter/material.dart';
import 'package:wisata_candi/Screens/SignInScreen.dart';
import 'package:wisata_candi/Screens/home_screen.dart';
import 'package:wisata_candi/Screens/profile.dart';
import 'package:wisata_candi/Screens/search_screen.dart';
import 'package:wisata_candi/data/candi_data.dart';
import "Screens/home_screen.dart";
import 'Screens/detail_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme:  AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple[50]),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ).copyWith(primary: Colors.deepPurple, surface: Colors.deepPurple[50]),
        useMaterial3: true,
      ),
    home: DetailScreen(candi: candiList[0]),
      
      
    );
  }

}

class MainSreen extends StatefulWidget {
  const MainSreen({super.key});

  @override
  State<MainSreen> createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
      final List<Widget> _children = [
         HomeScreen(),
         SearchScreen(),
         FavoriteScreen(),
         ProfileScreen(),
      ];
    return Scaffold(
      
    );
  }
}