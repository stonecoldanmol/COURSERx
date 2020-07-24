import 'package:coursesapp/constants.dart';
import 'package:coursesapp/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Courserx',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/search.svg"),
                      SizedBox(width: 16),
                      Text(
                        "Search for Courses",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFA0A5BD),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Category", style: kTitleTextStyle),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 2,
                    itemCount: categories.length,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(13),
                        height: 210,
                        width: 210,
                        decoration: BoxDecoration(
                          color: Colors.indigo[100],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              categories[index].name,
                              style: kTitleTextStyle,
                            ),
                            Image.asset(
                              categories[index].image,
                              fit: BoxFit.fill,
                            ),
                            /*Text(
                            '${categories[index].numOfCourses} Courses',
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                            ),
                          )*/
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
