import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _launch(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Not supported");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Url Launcher Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Open Dialer"),
              onPressed: () => _launch('tel:+91**********'),
            ),
            ElevatedButton(
              child: Text("Open WhatsApp"),
              onPressed: () => _launch(
                  'whatsapp://send?text=sample text&phone=91**********'),
            ),
            ElevatedButton(
              child: Text("Open SMS"),
              onPressed: () => _launch('sms:+91**********'),
            ),
            ElevatedButton(
              child: Text("Open Website"),
              onPressed: () => _launch('https://codesundar.com'),
            ),
            ElevatedButton(
              child: Text("Open Email"),
              onPressed: () => _launch(
                  'mailto:me@codesundar.com?subject=amazing tutorial&body=thanks dude'),
            ),
            Card(
              color: Colors.brown,
              margin: EdgeInsets.all(20),
              elevation: 5,
              child: SizedBox(
                height: 100.0,
                width: 100.0,
                child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {},
                    child: Center(
                        child: Text(
                      'data',
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),
            ListTile(
              title: Text('data'),
              subtitle: Text('this is data'),
              trailing: Icon(Icons.badge),
            ),
          ],
        ),
      ),
    );
  }
}
