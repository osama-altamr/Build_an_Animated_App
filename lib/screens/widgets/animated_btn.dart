import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class btnAnimation extends StatelessWidget {
  const btnAnimation({
    Key? key,
    required RiveAnimationController btnAnimation,
    required this.press,
  })  : _btnAnimation = btnAnimation,
        super(key: key);

  final RiveAnimationController _btnAnimation;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
          height: 60,
          width: 260,
          child: Stack(
            children: [
              RiveAnimation.asset(
                'assets/RiveAssets/button.riv',
                controllers: [_btnAnimation],
              ),
              Positioned.fill(
                  top: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(CupertinoIcons.arrow_right),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Get Started',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
