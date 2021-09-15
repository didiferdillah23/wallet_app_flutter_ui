import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/data/transactions.dart';
import 'data/card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff1a1a2e),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 40, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Wallet App",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "pBold",
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/img/profile.png",
                    width: 40,
                  ),
                ],
              ),
            ),
            // =======
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                ),
                items: [
                  for (var i = 0; i < cards.length; i++)
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(cards[i]["card_img"])),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 80),
                          Text(
                            cards[i]["balance"],
                            style: TextStyle(
                              fontFamily: "pBold",
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            cards[i]["no"],
                            style:
                                TextStyle(fontFamily: "p", color: Colors.white),
                          ),
                          Text(
                            cards[i]["name"],
                            style:
                                TextStyle(fontFamily: "p", color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            // ==========
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 40, 12, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "History",
                    style: TextStyle(
                      fontFamily: "pBold",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "pBold",
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // =========
            Expanded(
              child: ListView(
                children: [
                  for (var i = 0; i < transactions.length; i++)
                    // =====
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                transactions[i]["logo"],
                                width: 50,
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(transactions[i]["name"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "pBold",
                                        fontSize: 20,
                                      )),
                                  Text(transactions[i]["date"],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "p",
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Text(transactions[i]["price"],
                              style: TextStyle(
                                color: (transactions[i]["cash_in"])
                                    ? Colors.green
                                    : Colors.red,
                                fontFamily: "pBold",
                                fontSize: 19,
                              )),
                        ],
                      ),
                    ),
                  // =====
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
