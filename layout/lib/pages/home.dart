import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ความรู้เกี่ยวกับคอมพิวเตอร์"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext cotext, int index) {
                  return MyBox(data[index]["title"], data[index]["subtitle"],
                      data[index]["image_url"], data[index]["detail"]);
                },
                itemCount: data.length,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString("assets/data.json"),
          )),
    );
  }

  Widget MyBox(String titel, String subtitel, String image_url, String detail) {
    var v1, v2, v3, v4;
    v1 = titel;
    v2 = subtitel;
    v3 = image_url;
    v4 = detail;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      //    color: Colors.blue[50],
      height: 200,
      decoration: BoxDecoration(
          //color: Colors.blue[200],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(image_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.80), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titel,
            style: TextStyle(fontSize: 25, color: Colors.purple),
          ),
          Text(
            subtitel,
            style: TextStyle(fontSize: 15, color: Colors.purple),
          ),
          SizedBox(
            height: 25,
          ),
          TextButton(
              onPressed: () {
                print("Next page >>>");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(v1, v2, v3, v4)));
              },
              child: Text("อ่านต่อ..."))
        ],
      ),
    );
  }
}
