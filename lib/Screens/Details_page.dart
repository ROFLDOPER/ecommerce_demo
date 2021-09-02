import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Shoperpage extends StatefulWidget {
  final String topbarId;
  Shoperpage({required this.topbarId});

  @override
  _ShoperpageState createState() => _ShoperpageState();
}

final CollectionReference _topbarref =
    FirebaseFirestore.instance.collection("topbar");

class _ShoperpageState extends State<Shoperpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _topbarref.doc(widget.topbarId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Container(
                  child: Text(
                    "Error ${snapshot.toString()}",
                  ),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              // ignore: unused_local_variable
              Map<String, dynamic> documentData = snapshot.data.data();

              List imageList = documentData['image'];
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Services',
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Container(
                    child: Hero(
                      tag: 'my hero',
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 300,
                            width: double.infinity,
                            child: PageView(
                              children: [
                                for (var i = 0; i < imageList.length; i++)
                                  Container(
                                      child: Image.network(
                                    "${imageList[i]}",
                                    fit: BoxFit.cover,
                                  ))
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${documentData['title']}",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(height: 10.0),
                                Text("Oct 21, 2017 By DLohani"),
                                SizedBox(height: 10.0),
                                Divider(),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.favorite_border),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    InkWell(onTap: () {}, child: Text("20.2k")),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Icon(Icons.comment),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text("2.2k"),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore: unused_element
_launch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Not supported");
  }
}
