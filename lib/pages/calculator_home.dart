import 'package:cal_basic/pages/display_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              DisplayText(
                  hint: "Enter first Number", controller: displayOneController),
              const SizedBox(height: 20),
              DisplayText(
                  hint: "Enter second Number",
                  controller: displayTwoController),

              //To print answer
              Text(
                z.toString(),
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOneController.text)! +
                            num.tryParse(displayTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOneController.text)! -
                            num.tryParse(displayTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.minus),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOneController.text)! *
                            num.tryParse(displayTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.multiply),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOneController.text)! /
                            num.tryParse(displayTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.divide),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    x = 0;
                    y = 0;
                    z = 0;
                    displayOneController.clear();
                    displayTwoController.clear();
                  });
                },
                label: const Text("Clear",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                backgroundColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
