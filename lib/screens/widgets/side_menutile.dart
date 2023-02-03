// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:animated_app/models/rive_assets.dart';

class SideMenuTile extends StatelessWidget {
  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;
  const SideMenuTile({
    Key? key,
    required this.menu,
    required this.press,
    required this.riveOnInit,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                height: 56,
                width: isActive ? 288 : 0,curve: Curves.fastOutSlowIn,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF6792FF),
                      borderRadius: BorderRadius.circular(10)),
                )),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
