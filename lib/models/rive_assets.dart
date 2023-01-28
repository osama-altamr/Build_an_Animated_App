

import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachine, title, src;

  late SMIBool? input;
  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachine,
    required this.title,
    this.input,
  });
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: "HOME",
    stateMachine: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: "SEARCH",
    stateMachine: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: "CHAT",
    stateMachine: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: "BELL",
    stateMachine: "BELL_Interactivity",
    title: "Notifications",
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: "USER",
    stateMachine: "USER_Interactivity",
    title: "Profile",
  ),
];
