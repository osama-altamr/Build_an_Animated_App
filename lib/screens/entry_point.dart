// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:animated_app/screens/constants.dart';
import 'package:animated_app/screens/side_menu.dart';
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

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  RiveAsset selectedBottomNav = bottomNavs.first;
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor2,
        body: Stack(
          children: [
            AnimatedPositioned(
              width: 288,
              height: MediaQuery.of(context).size.height,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              left: isSideMenuClosed ? -288 : 0,
              top: 0,
              child: SideMenu(),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(
                    1 * animation.value - 30 * (animation.value) * pi / 180),
              child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(isSideMenuClosed ? 0 : 24),
                    ),
                    child: HomeScreen(),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              left: isSideMenuClosed ? 0 : 220,
              top: 16,
              child: MenuBtn(
                press: () {
                  isSideBarClosed.value = !isSideBarClosed.value;

                  if (_animationController.value == 0) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }

                  setState(
                    () {
                      isSideMenuClosed = !isSideMenuClosed;
                    },
                  );
                },
                riveOnInit: (artboard) {
                  final controller = StateMachineController.fromArtboard(
                      artboard, "State Machine");

                  artboard.addController(controller!);

                  isSideBarClosed =
                      controller.findInput<bool>("isOpen") as SMIBool;
                  isSideBarClosed.value = true;
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 12, top: 12, right: 12, bottom: 12),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: backgroundColor2.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor2.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                                    isActive:
                                        bottomNavs[index] == selectedBottomNav,
                                  ),
                                  SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Opacity(
                                      opacity:
                                          bottomNavs[index] == selectedBottomNav
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
                                          bottomNavs[index].input = controller
                                              .findSMI('active') as SMIBool;
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
        ));
  }
}

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    Key? key,
    required this.press,
    required this.riveOnInit,
  }) : super(key: key);
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(left: 20),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ]),
          child: RiveAnimation.asset(
            'assets/RiveAssets/menu_button.riv',
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
