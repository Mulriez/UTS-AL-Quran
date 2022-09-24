// ignore_for_file: prefer_const_constructors, unnecessary_this, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'model/albaqarah.dart';
import 'service/alservice.dart';

class AlBaqoroh extends StatefulWidget {
  const AlBaqoroh({super.key});

  @override
  State<AlBaqoroh> createState() => _AlBaqorohState();
}

class _AlBaqorohState extends State<AlBaqoroh> {
  List<Verse> dataAlBaqarah = [];

  void getQuranData() {
    AlService().getData().then((value) {
      setState(() {
        dataAlBaqarah = value;
      });
    });
  }

  @override
  void initState() {
    getQuranData();
    super.initState();
  }

  Widget appBar = Text('Al-Baqarah');
  Icon icon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: icon,
            onPressed: () {
              setState(() {
                if (this.icon.icon == Icons.search) {
                  this.icon = Icon(Icons.close);

                  this.appBar = TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Cari Ayat...",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                } else {
                  this.icon = Icon(Icons.search);
                  this.appBar = Text("Al-Baqarah");
                }
              });
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 550,
                      height: 360,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Al-Baqarah",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Sapi',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 180, top: 40),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    'Madaniyyah',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "•",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "286 Ayat",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Text(
                              "بِسْــــــــــــــــــمِ اللهِ الرَّحْمَنِ الرَّحِيْمِ ",
                              style: TextStyle(fontSize: 40),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/al-quran.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.dstOut)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: List.generate(dataAlBaqarah.length, ((index) {
                    return Al(context, dataAlBaqarah[index]);
                  })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Al(context, Verse data) {
  return Container(
    child: Row(
      children: [
        Container(
          width: 550,
          height: 500,
          margin: EdgeInsets.only(left: 25, top: 10),
                    child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                height: 500,
                child: Text(data.text.arab,
                maxLines: 7,
                style: 
                TextStyle(fontSize: 20),
                textAlign: TextAlign.right,
                ),
              ),
              Container(
                child: Text(data.text.transliteration.en,
                maxLines: 7,
                style: 
                TextStyle(fontSize: 20),
                textAlign: TextAlign.right,
                ),
              )
            ],
          ),    
        ),
      ],
    ),
  );
}
