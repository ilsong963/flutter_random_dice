import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('asset/img/$number.png')),
        SizedBox(height: 32),
        Text(
          '행운의숫자',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
        ),
        SizedBox(height: 32),
        Text(
          number.toString(),
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.w200,color: Colors.white),
        ),
      ],
    );
  }
}
