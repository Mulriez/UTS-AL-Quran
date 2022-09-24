// ignore_for_file: file_names, prefer_const_constructors, unnecessary_import, unused_import, unnecessary_this, avoid_unnecessary_containers, non_constant_identifier_names, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:uts_alquran/main.dart';
import 'model/dataAlQuran.dart';
import 'service/service.dart';

class Alquran extends StatefulWidget {
  const Alquran({super.key, required String title});

  @override
  State<Alquran> createState() => _AlquranState();
}

class _AlquranState extends State<Alquran> {
  List<Surat> dataAlQuran = [];

  void getQuranData() {
    QuranService().getData().then((value) {
      setState(() {
        dataAlQuran = value;
      });
    });
  }

  @override
  void initState() {
    getQuranData();
    super.initState();
  }

  Widget appBar = Text('Al-Quran');
  Icon icon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                        hintText: "Cari Surat...",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                } else {
                  this.icon = Icon(Icons.search);
                  this.appBar = Text("Al-Quran");
                }
              });
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 550,
                        height: 260,
                        margin: EdgeInsets.only(top: 20, bottom: 30),
                        child: Center(
                          child: Text(
                            'LETS Read Al-Quran',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/al-quran.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.dstOut)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: List.generate(dataAlQuran.length, ((index) {
                      return Data(context, dataAlQuran[index]);
                    })),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Data(context, Surat data) {
  return Container(
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 25, top: 10),
          width: 550,
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(197, 31, 219, 240),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/alBaqoroh");
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 14),
                  padding: EdgeInsets.symmetric(vertical: 17),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    data.number.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 15),
                          child: Text(
                            data.name.transliteration.id,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3, top: 15),
                          child: Text(
                            '•',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3, top: 15),
                          child: Text(
                            data.name.short,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 20),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              data.revelation.id,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Text('•'),
                          ),
                          Container(
                            child: Text(data.name.translation.id),
                          ),
                          Container(
                            child: Text('•'),
                          ),
                          Container(
                            child: Text(data.numberOfVerses.toString()),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 3),
                            child: Text('Ayat'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
