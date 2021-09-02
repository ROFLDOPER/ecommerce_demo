import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/Screens/Details_page.dart';
import 'package:ecommerce_demo/Utilites/drawer.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

// ignore: unused_import
import '../Constants/Constants.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  final CollectionReference _topbarref =
      FirebaseFirestore.instance.collection("topbar");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
        future: _topbarref.get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          {
            if (snapshot.hasError) {
              return Scaffold(
                body: Container(
                  child: Text(
                    "Error ${snapshot.toString()}",
                  ),
                ),
              );
            }

            //collection data ready to display
            if (snapshot.connectionState == ConnectionState.done) {
              //get user

              return Scaffold(
                appBar: NewGradientAppBar(
                    title: Text(
                      'LISTINGS',
                      style: TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.white, Colors.purple])),
                body: Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Shoperpage(
                                    topbarId: snapshot.data.docs[index].id),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.black,
                            child: ListTile(
                              tileColor: Colors.white,
                              visualDensity:
                                  VisualDensity.adaptivePlatformDensity,
                              contentPadding: EdgeInsets.all(20),
                              leading: Icon(Icons.fireplace),
                              trailing: Hero(
                                tag: 'my hero',
                                child: Image.network(
                                  snapshot.data.docs[index]['image'][0],
                                ),
                              ),
                              title: Text(
                                snapshot.data.docs[index]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      }
                      // itemBuilder: (ctx, index) =>
                      //     Text(snapshot.data.docs[index]['title']),
                      ),
                ),
                drawer: DrawerPage(),
              );
            }

            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
// children: someListOfObjects.map((el) => Text(el)).toList(),
