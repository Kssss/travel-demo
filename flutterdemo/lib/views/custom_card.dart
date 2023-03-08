import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final Function onPress;

  const CustomCard({
    required this.index,
    Key? key,
    required this.onPress,
  }) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("text $index"),
          TextButton(
              onPressed: () {
                onPress();
              },
              child: const Text("btn"))
        ],
      ),
    );
  }
}

 
