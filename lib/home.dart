import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromRadius(40),
          child: Text(''),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            topRight: Radius.circular(0),
          ),
        ),
        title: Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Duckky.id);
              },
              child: Text(
                'Artemis',
                style: TextStyle(color: Colors.white60, fontSize: 26),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: AnimSearchBar(
                  width: 260,
                  textController: txtcon,
                  onSuffixTap: () {
                    txtcon.clear();
                  },
                  onSubmitted: (String) {},
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff1a1a1a),
                      offset: Offset(0, 2),
                      spreadRadius: 2,
                      blurRadius: 12)
                ],
                borderRadius: BorderRadius.circular(26),
                color: Color(0xff303030),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Starboy',
                    style: TextStyle(fontSize: 40, color: Color(0xffa1a1a1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 300,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff241948),
                              offset: Offset(0, 1),
                              spreadRadius: 2,
                              blurRadius: 12)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff303030),
                      ),
                      child: TextButton(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text('Press',style: TextStyle(fontSize: 80),),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
