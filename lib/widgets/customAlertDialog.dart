
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_play/providers/game_provider.dart';

class CustomAlertDialog extends StatelessWidget {
 String title;
 CustomAlertDialog({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    var gameProvider= Provider.of<GameProvider>(context);

    return AlertDialog(
        title: Text(title),
        actions: [
          ElevatedButton(
              onPressed: (){
                gameProvider.playAgain();
                Navigator.pop(context);
                },
              child: const Text("Play again")),
        ],

      );
  }
}
