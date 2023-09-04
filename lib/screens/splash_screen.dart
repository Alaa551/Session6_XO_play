import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_play/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/game_provider.dart';
class SplashScreen extends StatelessWidget {
  String? playWith;

  saveData() async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString("playWith",playWith??"computer");


  }

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<GameProvider>(context);

    return Scaffold(

      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,

            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                 provider.playWith="friend";
                  Navigator.of(context).pushNamed(Home.id);
                },
                minWidth: 360,
                height: 65,
                elevation: 10,
                color: Colors.grey[300],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                child: const Text(
                  "Play with a friend ",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  provider.playWith="computer";
                  Navigator.of(context).pushNamed(Home.id);
                },
                minWidth: 360,
                height: 65,
                elevation: 10,
                color: Colors.grey[300],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                child: const Text(
                  "Play with computer",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),




      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text("Tic Tac Toe play",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
