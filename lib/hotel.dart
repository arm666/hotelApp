import 'package:flutter/material.dart';
import './data .dart';

class HotelScreen extends StatefulWidget {
  final id;
  HotelScreen(this.id);
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: HotelUI(this.widget.id),
        ),
      )),
    );
  }
}

class HotelUI extends StatefulWidget {
  final hotel_id;
  HotelUI(this.hotel_id);
  @override
  _HotelUIState createState() => _HotelUIState();
}

class _HotelUIState extends State<HotelUI> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(children: [
          Container(height: 450),
          Container(
            child: Hero(
                tag: "hotel_image" + this.widget.hotel_id.toString(),
                child: Image.asset(
                  hotel_detail[this.widget.hotel_id]['image'],
                  fit: BoxFit.fill,
                )),
            height: 400,
          ),
          Positioned(
            top: 50,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  !isFav
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          child: Icon(Icons.favorite,
                              color: Colors.white, size: 40))
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          child:
                              Icon(Icons.favorite, color: Colors.red, size: 40))
                ],
              ),
            ),
          ),
          Positioned(
              top: 380,
              right: 50,
              child: RaisedButton(
                elevation: 10,
                color: Colors.blue,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  width: 150,
                  child: Text(
                    "Book Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              )),
        ]),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            hotel_detail[this.widget.hotel_id]["name"],
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(children: [
              Icon(
                Icons.location_on,
                size: 18,
              ),
              SizedBox(width: 5),
              Text(
                hotel_detail[this.widget.hotel_id]["location"],
                style: TextStyle(color: Colors.grey),
              ),
            ])),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: starCount(hotel_detail[this.widget.hotel_id]['stars'],
              hotel_detail[this.widget.hotel_id]['reviews']),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            hotel_detail[this.widget.hotel_id]["price"],
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Description: " + hotel_detail[this.widget.hotel_id]["description"],
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            "Read More ...",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        facilityWidget(0),
        facilityWidget(1),
        facilityWidget(2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
              color: Color.fromRGBO(220, 220, 220, .5),
              borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                "Good To Know",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, .7),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "-Languages Spoken",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, .7),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "   - Nepali, English, Hindi etc..",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, .7),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "-Hotel Style",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, .7),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "   - Luxury , Business",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, .7),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Text(
                "website: www.hotel_in_nepal.com",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 255, .7),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(height: 50)
      ],
    );
  }

  Widget starCount(count, review) {
    var stars = "";
    for (var i = 0; i < count; i++) {
      stars += "⭐";
    }
    return Text(
      stars + " " + "[ $review ] reviews",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget facilityWidget(index) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            color: Color.fromRGBO(220, 220, 220, .5),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                facility[index].title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, .7),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: facility[index]
                      .content
                      .map<Widget>((item) => Text(
                            "- " + item,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, .7),
                              fontSize: 18,
                            ),
                          ))
                      .toList(),
                ))
          ],
        ));
  }
}
