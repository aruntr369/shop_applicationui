import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.grey[200],
          elevation: 0,
          leading: Image.asset("assets/images/hamburger.png"),
          actions: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                margin: EdgeInsets.all(10),
                child: Image.asset("assets/images/SEARCH.png"))
          ],
        ),
        body: Column(
          children: [
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Shop  ',
                  style: TextStyle(fontSize: 26, letterSpacing: 1),
                ),
                Text(
                  'Anthropologie',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTextButton('Home Decor', isSelected: true),
                buildTextButton('Bath & Body'),
                buildTextButton('Beauty'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(37)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 1,
                          blurRadius: 16)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildColumnTop('Candels', isSelected: true),
                        buildColumnTop('Vases'),
                        buildColumnTop('Bins'),
                        buildColumnTop('Floral'),
                        buildColumnTop('Decor'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          buildColumnWithRow(1, 'Elemental Tin Candel', 29),
                          buildColumnWithRow(2, 'Summer Candel', 30),
                          buildColumnWithRow(3, 'Winter Candel', 25),
                          buildColumnWithRow(4, 'WSpring Candel', 40),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextButton buildTextButton(String text, {bool isSelected = false}) {
    return TextButton(
      onPressed: () {
        print('button press');
      },
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54, fontSize: 18),
      ),
      style: ButtonStyle(
          backgroundColor: isSelected
              ? MaterialStateProperty.all(Colors.pink[100])
              : MaterialStateProperty.all(Colors.grey[300]),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          )),
    );
  }

  Column buildColumnTop(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Column(
          children: [
            Text(text,
                style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey,
                    fontSize: 18)),
            SizedBox(
              height: 5,
            ),
            if (isSelected)
              Container(
                height: 5,
                width: 5,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              )
          ],
        )
      ],
    );
  }

  Padding buildColumnWithRow(int imgurl, String title, int price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 220,
            width: 160,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/candel$imgurl.jpg",
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '\$ $price',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
