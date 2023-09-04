

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xo_play/providers/game_provider.dart';

import '../widgets/customMaterialButton.dart';

class Home extends StatelessWidget {
  const Home({super.key});
static const String id="home";
   @override
   Widget build(BuildContext context) {

     var provider= Provider.of<GameProvider>(context);
    // saveData(args);
     //print(args);

     return Scaffold(
       body: 
          Center(
           child: SafeArea(
             child: Column(
             children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Column(
                     children: [
                       Text("Player O",style: TextStyle(fontSize: 25),),
                       Text("Score: ${provider.scoreO}",style: TextStyle(fontSize: 20)),
                     ],
                   ),
                   const SizedBox(width: 40,),
                   Column(
                     children: [
                       Text("Player X",style: TextStyle(fontSize: 25)),
                       Text("Score: ${provider.scoreX}",style: TextStyle(fontSize: 20)),
                     ],
                   ),


                 ],
               ),
            ),
            const SizedBox(height: 40,),
            Container(
              padding: const EdgeInsetsDirectional.only(start: 10,end: 10,top: 15),
              height: 420,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.separated(
                  itemBuilder: (context, indexRow) =>  Container(
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CustomMaterialButton(index: (indexRow*3)+index,context: context,),
                              separatorBuilder: (context, index) => const SizedBox(width: 20,),
                              itemCount: 3,

                          ),
                        )
                      ],
                    ),
                  ),
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(height: 10,),

              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){provider.beginGame();},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh),
                    SizedBox(width: 10,),
                    Text("Reset game",style: TextStyle(fontSize: 25),),

                  ],
                ),
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
       leading: IconButton(
         onPressed: (){
           Navigator.pop(context);
           provider.beginGame();
         },
         icon: Icon(Icons.arrow_back),
       ),
       ),

       
     );
   }


}
