import "package:flutter/services.dart";
import 'package:uts_alquran/model/albaqarah.dart';

class AlService{
  getData() async{
    // ignore: unused_local_variable
    final String response = 
    await rootBundle.loadString('assets/json/AlBaqarah.json');

    //merubah string menjadi variable data 
    DetailSurat data =  detailSuratFromJson(response);

    //mengirim data list food yg spesifik
    return data.data.verses;
  }
}