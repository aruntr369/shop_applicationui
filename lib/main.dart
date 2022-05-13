import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_applicationui/DetailsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainerBottomNav(Icons.person),
                buildContainerBottomNav(Icons.shopping_bag),
                buildContainerBottomNav(Icons.home, isSelected: true),
                buildContainerBottomNav(Icons.favorite),
                buildContainerBottomNav(Icons.settings),
              ],
            ),
          ),
        ),
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
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 26,
                      letterSpacing: 1),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
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
                      MyCandelsList(),
                      SizedBox(
                        height: 15,
                      ),
                      LineBar(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 23.0, right: 23, top: 20, bottom: 2),
                        child: Row(
                          children: [
                            Text(
                              'Holiday Special',
                              style: TextStyle(fontSize: 24),
                            ),
                            Spacer(),
                            Text(
                              'View All',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            buildBottomContainer(4),
                            buildBottomContainer(3),
                            buildBottomContainer(2),
                            buildBottomContainer(1),
                          ],
                        ),
                      )
                    ],
                  ),
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

  Container buildBottomContainer(int i) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 200,
      width: 220,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox(
                  height: 150,
                  width: 100,
                  child: Image.asset(
                    'assets/images/candel$i.jpg',
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text('Coconut Milk'),
                Text(
                  '16 oz',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Spacer(),
                Text('\$ 28'),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? Colors.pink[100] : Colors.white,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)]
              : []),
      height: 50,
      width: 50,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Container(
        height: 5,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 40),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )),
        child: Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ))));
  }
}

class MyCandelsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          buildColumnWithRow(1, 'Elemental Tin Candel', 29, context),
          buildColumnWithRow(2, 'Summer Candel', 30, context),
          buildColumnWithRow(3, 'Winter Candel', 25, context),
          buildColumnWithRow(4, 'WSpring Candel', 40, context),
        ],
      ),
    );
  }

  GestureDetector buildColumnWithRow(
      int imgurl, String title, int price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsPage(imgurl, title, price, context),
        ));
      },
      child: Padding(
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
      ),
    );
  }
}
