import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_sing/screens/practice.dart';
import 'package:learn_to_sing/screens/sing.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          expandedHeight: 240,
          title: Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "Learn To Sing",
                style: GoogleFonts.kaushanScript(
                  fontSize: 32,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image(
                image: AssetImage("assets/images/music-app-bar.png"),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffFF0C27B),
                      Color(0xff4B1248),
                    ],
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PracticePage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Practice",
                        style: GoogleFonts.kaushanScript(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff00bf8f),
                      Color(0xff001510),
                    ],
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingingPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sing",
                        style: GoogleFonts.kaushanScript(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
