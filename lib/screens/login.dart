import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_2/screens/base_screen.dart';

enum Gender {
  Email,
  password,
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color enabled = const Color(0xFF827F8A);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color.fromARGB(255, 206, 214, 230);
  bool ispasswordev = true;
  Gender? selected;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: SizedBox(
              width: we,
              height: he,
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 1000),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 230.0),
                    ),
                    SizedBox(
                      height: he * 0.04,
                    ),
                    Image.asset(
                      'assets/icons/learning.jpg',
                      width: we * 0.8,
                      height: he * 0.4,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      width: we * 0.9,
                      height: he * 0.071,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: selected == Gender.Email
                            ? enabled
                            : backgroundColor,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () {
                          setState(() {
                            selected = Gender.Email;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email_outlined,
                              color: selected == Gender.Email
                                  ? enabledtxt
                                  : deaible),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color:
                                selected == Gender.Email ? enabledtxt : deaible,
                          ),
                        ),
                        style: TextStyle(
                            color:
                                selected == Gender.Email ? enabledtxt : deaible,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.03,
                    ),
                    Container(
                      width: we * 0.9,
                      height: he * 0.071,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: selected == Gender.password
                              ? enabled
                              : backgroundColor),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () {
                          setState(() {
                            selected = Gender.password;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock_open_outlined,
                                color: selected == Gender.password
                                    ? enabledtxt
                                    : deaible),
                            suffixIcon: IconButton(
                              icon: ispasswordev
                                  ? Icon(Icons.visibility_off,
                                      color: selected == Gender.password
                                          ? enabledtxt
                                          : deaible)
                                  : Icon(Icons.visibility,
                                      color: selected == Gender.password
                                          ? enabledtxt
                                          : deaible),
                              onPressed: () =>
                                  setState(() => ispasswordev = !ispasswordev),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: selected == Gender.password
                                    ? enabledtxt
                                    : deaible)),
                        obscureText: ispasswordev,
                        style: TextStyle(
                            color: selected == Gender.password
                                ? enabledtxt
                                : deaible,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.03,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BaseScreen()), //
                          );
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 87, 100, 170),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        child: Text(
                          "Login",
                          style: GoogleFonts.heebo(
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    Text(
                      "Forgot password?",
                      style: GoogleFonts.heebo(
                        color:const Color.fromARGB(255, 87, 100, 170),
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(
                      height: he * 0.12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.heebo(
                            color: const Color.fromARGB(255, 87, 100, 170),
                            letterSpacing: 0.5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.heebo(
                              color: const Color.fromARGB(255, 87, 100, 170),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
