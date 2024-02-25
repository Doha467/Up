import 'package:flutter/material.dart';

class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "DevWheels",
    completedPercentage: .75,
    name: "Flutter Novice to Ninja",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .60,
    name: "React Novice to Ninja",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .75,
    name: "Node - The complete guide",
    thumbnail: "assets/icons/node.png",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .75,
    name: "Flutter Novice to Ninja",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .60,
    name: "React Novice to Ninja",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .75,
    name: "Node - The complete guide",
    thumbnail: "assets/icons/node.png",
  ),
];

class ResponsiveCourseCard extends StatelessWidget {
  final Course course;

  const ResponsiveCourseCard({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            course.thumbnail,
            height: MediaQuery.of(context).size.width * 0.25,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            course.name,
            style: Theme.of(context).textTheme.subtitle1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.0),
          Text(
            "by ${course.author}",
            style: Theme.of(context).textTheme.caption,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.0),
          LinearProgressIndicator(
            value: course.completedPercentage,
            backgroundColor: Colors.grey[300],
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

class ResponsiveCoursesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return ResponsiveCourseCard(course: courses[index]);
      },
      itemCount: courses.length,
    );
  }
}
