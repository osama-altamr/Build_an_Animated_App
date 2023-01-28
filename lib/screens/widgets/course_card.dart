
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_page.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 260,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 10,
                ),
                child: Text(
                  course.desc,
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
              const Text(
                '2:00 AM -- 7 PM',
                style: TextStyle(
                  color: Colors.white60,
                ),
              ),
              Spacer(),
              Row(
                children: List.generate(
                    3,
                    (index) => Transform.translate(
                          offset: Offset((-10 * index.toDouble()), 0),
                          child: CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage(
                                  'assets/avaters/Avatar ${index + 1}.jpg')),
                        )),
              )
            ],
          ),
        ),
        SvgPicture.asset(course.iconSrc)
      ]),
    );
  }
}
