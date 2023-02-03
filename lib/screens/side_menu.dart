import 'package:animated_app/models/rive_assets.dart';
import 'package:animated_app/screens/constants.dart';
import 'package:animated_app/screens/widgets/info_card.dart';
import 'package:animated_app/screens/widgets/side_menutile.dart';
import 'package:animated_app/screens/widgets/urtils_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 288,
          color: Color(0xFF17203A),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const InfoCard(
              name: "Osama Altamr",
              profession: 'Flutter developer',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                'Browse'.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white70,
                    ),
              ),
            ),
            ...sideMenus.map((e) => SideMenuTile(
                  menu: e,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.giveRiveController(
                      artboard,
                      stateMachine: e.stateMachine,
                    );
                    e.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    e.input!.change(true);
                    Future.delayed(
                      Duration(seconds: 1),
                    ).then((value) {
                      e.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = e;
                    });
                  },
                  isActive: selectedMenu == e,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                'History'.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white70,
                    ),
              ),
            ),
            ...sideMenus2.map((e) => SideMenuTile(
                  menu: e,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.giveRiveController(
                      artboard,
                      stateMachine: e.stateMachine,
                    );
                    e.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    e.input!.change(true);
                    Future.delayed(
                      Duration(seconds: 1),
                    ).then((value) {
                      e.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = e;
                    });
                  },
                  isActive: selectedMenu == e,
                )),
          ]),
        ),
      ),
    );
  }
}
