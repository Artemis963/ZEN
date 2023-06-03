import 'package:flutter/material.dart';


void main() {
  runApp(Duckling());
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
      duration: Duration(milliseconds: 2500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,children: [
          Center(
            child: Column(
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/image/ass.png',
                    width: 300,
                  ),
                ),SizedBox(height: 80,),
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'This is Google Fonts',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
