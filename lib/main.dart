import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //lets declare some variables that is used for the animation
  double height = 140;
  double bottomheight = 130;
  double width = 410;
  double turns = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: height,
          width: width,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: bottomheight,
                width: 400,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      HoverText(text: 'Portfolio'),
                      HoverText(text: 'Website'),
                      HoverText(text: 'LinkedIn'),
                      HoverText(text: 'Socialmedia'),
                      HoverText(text: 'Contact'),
                      HoverText(text: 'Contribution'),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 130,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color(0xffD9CAB3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10.0,
                      spreadRadius: 0,
                      offset: const Offset(5, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/9777468/pexels-photo-9777468.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                          radius: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Rachel Green",
                                style: GoogleFonts.montserrat(
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Engineer",
                                style: GoogleFonts.quicksand(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: () {
                    setState(() {
                      height = height == 140 ? 400 : 140;
                      turns = turns == 0.5 ? 1 : 0.5;
                      bottomheight = bottomheight == 130 ? 400 : 130;
                    });
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 35.0,
                      width: 35.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xff212121),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: const Icon(
                        FontAwesome.arrow_down,
                        size: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//lets create a widget that hold hover animatioon for the text

class HoverText extends StatefulWidget {
  final String? text;

  HoverText({required this.text});

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  Color? hoverColor = Colors.white;
  Color? hoverTextColor = Colors.black87;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (a) {
          setState(() {
            hoverColor = Color(0xff6D9886);
            hoverTextColor = Colors.white;
          });
        },
        onExit: (a) {
          setState(() {
            hoverColor = Colors.white;
            hoverTextColor = Colors.black87;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
          color: hoverColor,
          child: Text(
            widget.text!,
            style: GoogleFonts.quicksand(
              fontSize: 16.0,
              color: hoverTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }
}
