import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/Screens/Details_page.dart';
import 'package:ecommerce_demo/Utilites/drawer.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

// ignore: unused_import
import '../Constants/Constants.dart';

class SliderPage extends StatelessWidget {
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
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
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
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: .3, color: Colors.black),
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot.data.docs[index]['image'][0],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              snapshot.data.docs[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                // fontSize: 14,
                              ),
                            )
                          ]),
                        );
                      }
                      // itemBuilder: (ctx, index) =>
                      //     Text(snapshot.data.docs[index]['title']),
                      ),
                ),
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
