import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

void main() {
  runApp(const dicee_app());
}

class dicee_app extends StatefulWidget {
  const dicee_app({Key? key}) : super(key: key);

  @override
  _dicee_appState createState() => _dicee_appState();
}

class _dicee_appState extends State<dicee_app> {
  int leftDiceNumber = 1; // Delearing the number
  int rightDiceNumber = 2;

  // In build method below, we just update the dice number

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade400,
        appBar: AppBar(
          backgroundColor: Colors.red.shade300,
          title: const Text(
            'Dice Roolling App',
          ),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // convert image to a button to make it clickable (see flutter button documentation)
                  // here using a flat button
                  child: TextButton(
                    // Text button don't have any background
                    onPressed: () {
                      setState(() {
                        // this method is used to change the state of the app
                        leftDiceNumber = Random().nextInt(6) + 1;
                        // Random method generate numbers from "0 to 6-1"
                        // To avoid 0 add 1 to Random() method

                        // Change both dices on clicking any one button
                        // rightDiceNumber = Random().nextInt(6) + 1;
                      });

                      // showing the toast
                      Fluttertoast.showToast(
                        msg: 'Left Dice = $leftDiceNumber',
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 18,
                        backgroundColor: Colors.green,
                        textColor: Colors.black,
                      );
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        rightDiceNumber = Random().nextInt(6) + 1;
                        // Random method generate numbers from "0 to 6-1"
                        // To avoid 0 add 1 to Random() method

                        // Change both dices on clicking any one button
                        // leftDiceNumber = Random().nextInt(6) + 1;
                      });

                      Fluttertoast.showToast(
                        msg: 'Right Dice = $rightDiceNumber',
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 18,
                        backgroundColor: Colors.green,
                        textColor: Colors.black,
                      );
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


