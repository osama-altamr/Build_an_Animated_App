// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_app/screens/constants.dart';
import 'package:animated_app/screens/widgets/animated_bar.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:animated_app/screens/widgets/urtils_rive.dart';

import '../models/rive_assets.dart';
import 'home_page.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                      onTap: () {
                        bottomNavs[index].input!.change(true);
                        if (selectedBottomNav != bottomNavs[index]) {
                          setState(() {
                            selectedBottomNav = bottomNavs[index];
                          });
                        }

                        Future.delayed(const Duration(seconds: 1), () {
                          bottomNavs[index].input!.change(false);
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBar(
                            isActive: bottomNavs[index] == selectedBottomNav,
                          ),
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Opacity(
                              opacity: bottomNavs[index] == selectedBottomNav
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(
                                bottomNavs[index].src,
                                artboard: bottomNavs[index].artboard,
                                onInit: (p0) {
                                  StateMachineController controller =
                                      RiveUtils.giveRiveController(
                                    p0,
                                    stateMachine:
                                        bottomNavs[index].stateMachine,
                                  );
                                  bottomNavs[index].input =
                                      controller.findSMI('active') as SMIBool;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
          ]),
        ),
      ),
    );
  }
}
