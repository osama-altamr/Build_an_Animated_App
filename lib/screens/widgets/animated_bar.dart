import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({Key? key, required this.isActive}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 2, right: 2),
      height: 4,
      width: isActive ? 22 : 0,
      decoration: BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}