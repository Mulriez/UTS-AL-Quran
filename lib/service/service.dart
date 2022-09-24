import "package:flutter/services.dart";
import "package:uts_alquran/model/dataAlQuran.dart";

class QuranService{
  getData() async{
    // ignore: unused_local_variable
    final String response = 
    await rootBundle.loadString('assets/json/Alquran.json');

    //merubah string menjadi variable data foods
    AlQuran data =  alQuranFromJson(response);

    //mengirim data list food yg spesifik
    return data.data;
  }
}