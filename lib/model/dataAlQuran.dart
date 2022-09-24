// To parse this JSON data, do
//
//     final alQuran = alQuranFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AlQuran alQuranFromJson(String str) => AlQuran.fromJson(json.decode(str));

String alQuranToJson(AlQuran data) => json.encode(data.toJson());

class AlQuran {
    AlQuran({
        required this.code,
        required this.status,
        required this.message,
        required this.data,
    });

    int code;
    String status;
    String message;
    List<Surat> data;

    factory AlQuran.fromJson(Map<String, dynamic> json) => AlQuran(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<Surat>.from(json["data"].map((x) => Surat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Surat {
    Surat({
        required this.number,
        required this.sequence,
        required this.numberOfVerses,
        required this.name,
        required this.revelation,
        required this.tafsir,
    });

    int number;
    int sequence;
    int numberOfVerses;
    Name name;
    Revelation revelation;
    Tafsir tafsir;

    factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        tafsir: Tafsir.fromJson(json["tafsir"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name.toJson(),
        "revelation": revelation.toJson(),
        "tafsir": tafsir.toJson(),
    };
}

class Name {
    Name({
        required this.short,
        required this.long,
        required this.transliteration,
        required this.translation,
    });

    String short;
    String long;
    Translation transliteration;
    Translation translation;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json["short"],
        long: json["long"],
        transliteration: Translation.fromJson(json["transliteration"]),
        translation: Translation.fromJson(json["translation"]),
    );

    Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration.toJson(),
        "translation": translation.toJson(),
    };
}

class Translation {
    Translation({
        required this.en,
        required this.id,
    });

    String en;
    String id;

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
    };
}

class Revelation {
    Revelation({
        required this.arab,
        required this.en,
        required this.id,
    });

    String arab;
    String en;
    String id;

    factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json["arab"],
        en: json["en"],
        id: json["id"]
    );

    Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id
    };
}

class Tafsir {
    Tafsir({
        required this.id,
    });

    String id;

    factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}