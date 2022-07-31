import 'package:flutter/material.dart';
import 'package:submission_dicoding/detailsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 64, 188, 29),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0, left: 30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logoGym.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Atur porsi makanmu\ndengan harga yang sama!',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white)),
            ]),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Healthy',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Food',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: 400.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
              image: DecorationImage(
                image: AssetImage("assets/backgroundPage.png"),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buildFoodItem('assets/plate1.png', 'Salmon bowl',
                              '\$26.0', context),
                          _buildFoodItem('assets/plate2.png', 'Spring bowl',
                              '\$26.0', context),
                          _buildFoodItem('assets/plate3.png', 'Avocado bowl',
                              '\$26.0', context),
                          _buildFoodItem('assets/plate4.png', 'Berry bowl',
                              '\$26.0', context),
                          _buildFoodItem('assets/plate5.png', 'Tuna bowl',
                              '\$26.0', context),
                          _buildFoodItem('assets/plate6.png', 'Meat bowl',
                              '\$26.0', context),
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(
      String imgPath, String foodName, String price, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 9.0, top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                  heroTag: imgPath, foodName: foodName, foodPrice: price)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color.fromARGB(255, 237, 232, 232).withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 134, 161, 37)))
                      ]),
                ]),
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          heroTag: imgPath,
                          foodName: foodName,
                          foodPrice: price)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
