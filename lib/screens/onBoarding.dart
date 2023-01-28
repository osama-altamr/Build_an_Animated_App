import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import 'onboarding/components/animated_btn.dart';
import 'widgets/custom_sign_in_dialog.dart';
import 'widgets/sign_in_form.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late RiveAnimationController _btnAnimation;
  bool isSignInDialogShow = false;
  @override
  void initState() {
    _btnAnimation = OneShotAnimation("active", autoplay: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          width: MediaQuery.of(context).size.width * 1.4,
          left: 100,
          bottom: 200,
          child: Image.asset('assets/Backgrounds/Spline.png'),
        ),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 15,
          ),
          child: SizedBox(),
        )),
        RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30,
            sigmaY: 30,
          ),
          child: SizedBox(),
        )),
        AnimatedPositioned(
          top: isSignInDialogShow ? -500 : 0,
          duration: const Duration(milliseconds: 400),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  const Text(
                    'Learn flutter & dart',
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'Poppins',
                      height: 1.2,
                    ),
                  ),
                  const Text(
                    'Consectetur commodo. Enim sint est quis et mollit adipisicing sunt voluptate aute amet. Magna voIpsum officia excepteur velit ea nisi adipisicing culpa voluptate exercitation.',
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  btnAnimation(
                    btnAnimation: _btnAnimation,
                    press: () {
                      _btnAnimation.isActive = true;
                      Future.delayed(Duration(milliseconds: 750), () {
                        setState(() {
                          isSignInDialogShow = true;
                        });
                        CustomSignInDialog(context, onClosed: (_) {
                          setState(() {
                            isSignInDialogShow = false;
                          });
                        });
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Consectetur commodo. adipisicing culpa voluptate exercitation.',
                    ),
                  ),
                ],
              ),
            ),
          )),
        )
      ]),
    );
  }
}
