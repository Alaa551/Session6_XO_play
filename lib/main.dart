import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_play/providers/game_provider.dart';
import 'package:xo_play/screens/home.dart';
import 'package:xo_play/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
         ChangeNotifierProvider(
             create: (context) => GameProvider(),)
        ],

              child:  MaterialApp(

                theme: ThemeData(
                useMaterial3: true,
              ),
                routes: {
                  Home.id : (context) => const Home(),
                },

              home: SplashScreen(),

              debugShowCheckedModeBanner: false,
            ),


    );

  }
}
