import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              })
        ],
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '$clickCounter',
          style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
        ),
        Text(
          'Click${clickCounter == 1 ? '' : 's'}',
          style: const TextStyle(fontSize: 25),
        )
      ])),
      floatingActionButton: Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomButton(
                icon: Icons.exposure_minus_1_outlined,
                onPressed: () {
                  setState(() {
                    if (clickCounter == 0) return;
                    clickCounter--;
                  });
                }),
            CustomButton(
                icon: Icons.refresh_outlined,
                onPressed: () {
                  setState(() {
                    clickCounter = 0;
                  });
                }),
            CustomButton(
                icon: Icons.plus_one_outlined,
                onPressed: () {
                  setState(() {
                    clickCounter++;
                  });
                })
          ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const StadiumBorder(), onPressed: onPressed, child: Icon(icon));
  }
}
