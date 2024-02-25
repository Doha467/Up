import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_2/contants/color.dart';

import 'package:lms_2/screens/course_screen.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: const Color.fromARGB(255, 178, 144, 184),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ResponsiveBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Categories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CourseScreen()));
              },
              child: const Text(
                'library',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CourseScreen()));
              },
              child: const Text(
                'Online',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CourseScreen()));
              },
              child: const Text(
                'Training',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 2
                          : 4,
                  childAspectRatio: 300 / 450,
                  crossAxisSpacing: constraints.maxWidth * 0.03,
                  mainAxisSpacing: constraints.maxHeight * 0.03,
                ),
                itemBuilder: (context, index) {
                  return CategoryCard();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: MediaQuery.of(context).size.width * 0.01,
              spreadRadius: MediaQuery.of(context).size.width * 0.001,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/icons/laptop.jpg'),
              const Text('Categories',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '555',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFAC025),
                  ),
                  Text(
                    '0:00',
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Text(
                    '222',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
