import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  int imgurl;
  String title;
  int price;
  BuildContext context;

  DetailsPage(this.imgurl, this.title, this.price, this.context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/candel$imgurl.jpg",
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        IconButton(
          padding: EdgeInsets.only(left: 20, top: 40),
          onPressed: () {
            return Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ILLUM'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$title",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            '\$$price',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SIZE'),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '16 OZ',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              )
                            ],
                          )),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('QTY'),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '1',
                                style: TextStyle(fontSize: 22),
                              )
                            ],
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      ListTile(
                        leading: Text(
                          'Details',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing:
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      ListTile(
                        leading: Text(
                          'Shopping & Returns',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing:
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                    ],
                  ),
                )),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.favorite_border),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            shape: BoxShape.circle,
                            color: Colors.white),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Add to Basket',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink.shade100),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 6,
                                  vertical: 10)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
