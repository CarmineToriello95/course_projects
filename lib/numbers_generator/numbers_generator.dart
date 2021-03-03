import 'package:flutter/material.dart';
import 'dart:math';

class NumbersGenerator extends StatefulWidget {
  @override
  _NumbersGeneratorState createState() => _NumbersGeneratorState();
}

class _NumbersGeneratorState extends State<NumbersGenerator> {
  int leftNumber = 1;
  int rightNumber = 20;
  bool isLeftBoxTapped = false;
  bool isRightBoxTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          leftNumber = Random().nextInt(20) + 1;
          rightNumber = Random().nextInt(20) + 20;
          isLeftBoxTapped = false;
          isRightBoxTapped = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Numbers Generator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomBox(
                      number: leftNumber,
                      onTap: onLeftBoxTap,
                      color: isLeftBoxTapped ? Colors.green : Colors.blue,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: CustomBox(
                      number: rightNumber,
                      onTap: onRightBoxTap,
                      color: isRightBoxTapped ? Colors.red : Colors.blue,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onLeftBoxTap() {
    setState(() {
      leftNumber = Random().nextInt(20) + 1;
      isLeftBoxTapped = true;
    });
  }

  void onRightBoxTap() {
    setState(() {
      rightNumber = Random().nextInt(20) + 20;
      isRightBoxTapped = true;
    });
  }
}

class CustomBox extends StatelessWidget {
  final int number;
  final Function() onTap;
  final Color color;

  CustomBox({this.number = 1, this.onTap, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FittedBox(
          child: Text(
            '$number',
            style: TextStyle(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
