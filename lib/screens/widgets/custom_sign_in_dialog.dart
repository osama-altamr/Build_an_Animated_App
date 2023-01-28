import 'package:animated_app/screens/widgets/sign_in_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<Object?> CustomSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Sign In',
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
      pageBuilder: (ctx, _, __) => Center(
            child: Container(
              height: 620,
              padding: const EdgeInsets.only(left: 25, right: 25, top: 32,),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.94),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  clipBehavior: Clip.none,
                 
                  child: Column(
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Voluptate aliqua est in reprehenderit laboris sit reprehenderit eiusmod deserunt enim minim amet.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SignInForm(),
                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'OR',
                              style: TextStyle(color: Colors.black26),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Text(
                          'Sign up with Email,Apple or Google ',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/email_box.svg',
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/apple_box.svg',
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/google_box.svg',
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )).then(onClosed);
}


/* 
Positioned(
                        bottom: -40,
                        right: 0,
                        left: 0,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ) */