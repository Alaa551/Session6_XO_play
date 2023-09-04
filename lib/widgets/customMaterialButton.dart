
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_play/providers/game_provider.dart';

class CustomMaterialButton extends StatelessWidget {
    int index;
    BuildContext context ;

   CustomMaterialButton({super.key, required this.index, required this.context});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) =>
       MaterialButton(
        onPressed: (){
          gameProvider.onPressOnButton(index,this.context);
        },
        height: 125,
         minWidth: 110,
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(gameProvider.xAndOList[index],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 60,color: Colors.white),),
      ),
    );
  }
}
