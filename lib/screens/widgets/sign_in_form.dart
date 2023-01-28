import 'package:animated_app/screens/widgets/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import '../entry_point.dart';
import 'urtils_rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> globalKey = GlobalKey();
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  bool isShowLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                  child: TextFormField(
                    decoration: CustomInputDecoration(
                      '',
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset("assets/icons/email.svg"),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Invalid Email";
                      }
                      return null;
                    },
                    onSaved: (email) {},
                  ),
                ),
                const Text(
                  'Password',
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: CustomInputDecoration(
                      '',
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset("assets/icons/password.svg"),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Invalid Password";
                      }
                      return null;
                    },
                    onSaved: (password) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        isShowLoading = true;
                      });
                      Future.delayed(Duration(seconds: 1), () {
                        if (globalKey.currentState!.validate()) {
                          check.fire();

                          Future.delayed(const Duration(seconds: 2), () {
                            confetti.fire();
                          }).then((_) {
                            setState(() {
                              isShowLoading = false;
                            });

                            Future.delayed(Duration(milliseconds: 1500), () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (_) {
                                return EntryPoint();
                              }), (route) => false);
                            });
                          });
                        } else {
                          error.fire();
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isShowLoading = false;
                            });
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFFF77D8E,
                        ),
                        minimumSize: const Size(double.infinity, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ))),
                    icon: const Icon(
                      CupertinoIcons.arrow_right,
                      color: Color(0xFFFE0037),
                    ),
                    label: const Text('Sign In'),
                  ),
                ),
              ],
            )),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  'assets/RiveAssets/check.riv',
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.giveRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
                size: 100)
            : SizedBox(),
        CustomPositioned(
            size: 100,
            child: Transform.scale(
              scale: 10.1,
              child: RiveAnimation.asset(
                'assets/RiveAssets/confetti.riv',
                onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.giveRiveController(artboard);
                  confetti =
                      controller.findSMI('Trigger explosion') as SMITrigger;
                },
              ),
            ))
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, required this.size});
  final Widget child;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
