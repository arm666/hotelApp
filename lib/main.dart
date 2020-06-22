import 'package:flutter/material.dart';

import './hotel.dart';
import './data .dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: HomePage(),
            bottomNavigationBar: Container(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, .2),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Icon(
                        Icons.date_range,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Icon(
                        Icons.person_outline,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.menu), Icon(Icons.account_circle)],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Hi Alex,\n",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(80, 0, 80, 1),
                      )),
                  TextSpan(
                      text: "Where you want to go?\n",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(80, 0, 80, 1),
                          height: 1.3)),
                  TextSpan(
                      text: "Get ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(80, 0, 80, .8),
                          height: 1.3)),
                  TextSpan(
                      text: " Hotel Mate ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(80, 0, 80, 1),
                      )),
                  TextSpan(
                      text: " Exclusivity",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(80, 0, 80, .8),
                      )),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(250, 250, 250, .5),
                borderRadius: BorderRadius.circular(500)),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Where you want to go?",
                filled: true,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: MediaQuery.of(context).size.width / 2,
              child: RaisedButton(
                elevation: 10,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Text(
                  "Search",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Recent Search",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: .5),
            ),
            Container(
                child: Row(
              children: [
                Text(
                  "View all",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      letterSpacing: .5),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.blue,
                )
              ],
            ))
          ]),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (scrollNotifi) {
                scrollNotifi.disallowGlow();
                return true;
              },
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotel_detail.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HotelScreen(index)));
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(top: 20, bottom: 10, right: 20),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Hero(
                                    tag: "hotel_image$index",
                                    child: Image.asset(
                                      hotel_detail[index]['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    hotel_detail[index]['name'].toString() +
                                        ", " +
                                        hotel_detail[index]['place'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    hotel_detail[index]['price'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
