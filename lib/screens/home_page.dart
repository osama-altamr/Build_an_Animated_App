import 'package:animated_app/screens/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  'Courses',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...allCourses
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.only(left: 22.0, right: 2),
                              child: CourseCard(course: e),
                            ))
                        .toList(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 26),
                child: Text(
                  'Recent',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ...recentCourses.map((e) => Container(
                    margin: const EdgeInsets.only(top: 6),
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: SecondaryCourseCard(course: e),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
          color: course.bgColor, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              course.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(
                'Watch video -15 min ',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                ),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(color: Colors.white),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 35,
          width: 35,
          child: Transform.scale(
            scale: 1.5,
            child: RiveAnimation.asset(
              'assets/RiveAssets/onboard_animation.riv',
            ),
          ),
        )
      ]),
    );
  }
}

class Course {
  final String title;
  final String desc;
  final String iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    required this.desc,
    required this.iconSrc,
    this.bgColor = const Color.fromARGB(255, 58, 136, 246),
  });
}

List<Course> allCourses = [
  Course(
    title: 'The Complete Flutter Development',
    desc: "Tempor sint mollit anim et.",
    iconSrc: "assets/icons/ios.svg",
  ),
  Course(
    title: 'Clean Architecture [2022][Flutter 3] ',
    desc: "Non est anim exercitation qui magna aliquip.",
    iconSrc: "assets/icons/ios.svg",
    bgColor: Color(0xFFF77D8E),
  ),
  Course(
    title: 'The Complete Dart learning Guide [2022]',
    desc: "Cupidatat commodo eiusmod dolor aliquip occaecat velit ad sunt.",
    iconSrc: "assets/icons/ios.svg",
    bgColor: Color(0xFF9CC5FF),
  ),
  Course(
    title: 'Python for Machine Learning',
    desc: "Eiusmod veniam adipisicing voluptate consectetur.",
    iconSrc: "assets/icons/ios.svg",
    bgColor: Color.fromARGB(255, 220, 58, 79),
  ),
];

List<Course> recentCourses = [
  Course(
    title: 'Learn Adobe XD For UI UX ',
    desc: "Watch video -15 min",
    iconSrc: "assets/icons/ios.svg",
    bgColor: Color.fromARGB(255, 97, 158, 244),
  ),
  Course(
    title: 'Advanced Course Payment',
    desc: "Watch video -30 min",
    iconSrc: "assets/icons/ios.svg",
    bgColor: Color.fromARGB(255, 235, 93, 112),
  ),
  Course(
    title: 'Learn HTML - For Beginners',
    desc: "Watch video -25 min",
    iconSrc: "assets/icons/ios.svg",
    bgColor: Color.fromARGB(255, 95, 156, 243),
  ),
];
