import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lms_2/contants/size.dart';
import 'package:lms_2/models/category.dart';
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
          title: Text('L.M.S'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 178, 144, 184),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ResponsiveBody(),
            ),
          ],
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
              onTap: () {},
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
                // navigatorPush(context,const CoursesScreen());
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
              onTap: () {},
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
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.05,
                  vertical: constraints.maxHeight * 0.01,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.05,
                    vertical: constraints.maxHeight * 0.01,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 2
                        : 4,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: constraints.maxWidth * 0.03,
                    mainAxisSpacing: constraints.maxHeight * 0.03,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: categoryList[index],
                    );
                  },
                  itemCount: categoryList.length,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CourseScreen(),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail,
                height: kCategoryCardImageSize,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(category.name),
            Text(
              "${category.noOfCourses.toString()} courses",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
.............................................................................
class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Development',
    noOfCourses: 55,
    thumbnail: 'assets/icons/laptop.jpg',
  ),
  Category(
    name: 'Accounting',
    noOfCourses: 20,
    thumbnail: 'assets/icons/accounting.jpg',
  ),
  Category(
    name: 'Photography',
    noOfCourses: 16,
    thumbnail: 'assets/icons/photography.jpg',
  ),
  Category(
    name: 'Product Design',
    noOfCourses: 25,
    thumbnail: 'assets/icons/design.jpg',
  ),
];
........................................................
Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.homeModel.data![0].price!,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const Icon(
                      Icons.star,
                      color: Color(0xffFAC025),
                    ),
                    Text(
                      state.homeModel.data![index].review!,
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Text(
                        '${state.homeModel.data![index].totalEnrolled!} Std',
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w800),
                    ),
                  ],
                )
                ................................................
                 onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CourseScreen(),
        ),
      ),
      ...........................................
      import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_2/contants/color.dart';

import 'package:lms_2/models/category.dart';

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
          title: const Text('L.M.S'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 178, 144, 184),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ResponsiveBody(),
            ),
          ],
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
              onTap: () {},
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
                // navigatorPush(context,const CoursesScreen());
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
              onTap: () {},
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
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.05,
                  vertical: constraints.maxHeight * 0.01,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.05,
                    vertical: constraints.maxHeight * 0.01,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 2
                        : 4,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: constraints.maxWidth * 0.03,
                    mainAxisSpacing: constraints.maxHeight * 0.03,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryCard();
                  },
                  itemCount: categoryList.length,
                ),
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
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xffFAC025),
                ),
                Text(
                  '',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
