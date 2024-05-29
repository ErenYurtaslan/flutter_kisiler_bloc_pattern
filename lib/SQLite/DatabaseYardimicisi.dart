import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseYardimcisi{
  static const String database = "kisiListesi.db";

  static Future<Database> dbErisim() async{
    String dbPath = join(await getDatabasesPath(), database);

    if(await databaseExists(dbPath)){
      print("Db zaten var.");
    }else{
      ByteData data = await rootBundle.load("database/$database");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes, flush: true);
      print("Db kopyalandı.");
    }
    return openDatabase(dbPath);
  }
}