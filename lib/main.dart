import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

void main() {
  runApp(Duck());
}

class Duck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Apply dark theme here
      home: Duckling(),
    );
  }
}

class Duckling extends StatefulWidget {
  @override
  _DucklingState createState() => _DucklingState();
}

class _DucklingState extends State<Duckling>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    );

    _animationController.forward().whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return HomeScreen();
        }),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      'assets/image/ass.png',
                      width: 300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                FadeTransition(
                  opacity: _animation,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          Color(0xFF86FBA4),
                          Color(0xFFFFFFFF),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: Text(
                      'Zen',
                      style: GoogleFonts.nunito(
                        textStyle: Theme.of(context).textTheme.headline3,
                        fontSize: 69,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
