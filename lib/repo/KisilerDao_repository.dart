import 'package:flutter_kisiler_bloc_pattern/SQLite/DatabaseYardimicisi.dart';
import 'package:flutter_kisiler_bloc_pattern/entity/Kisiler.dart';

class KisilerDaoRepository{


  Future<void> kayit(String kad, String kno) async{
    var  db = await DatabaseYardimcisi.dbErisim();
    var bilgi = Map<String, dynamic>();
    bilgi["kisi_ad"] = kad;
    bilgi["kisi_no"] = kno;

    await db.insert("kisiler", bilgi);
  }

  Future<void> guncelle(int kid,String kad, String kno) async{
    var  db = await DatabaseYardimcisi.dbErisim();
    var bilgi = Map<String, dynamic>();
    bilgi["kisi_ad"] = kad;
    bilgi["kisi_no"] = kno;

    await db.update("kisiler", bilgi, where: "kisi_id=?", whereArgs: [kid]);
  }

  Future<List<Kisiler>> tumKisileriAl() async {
    var  db = await DatabaseYardimcisi.dbErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (index){
      var row = maps[index];
      return Kisiler(
        kisi_id:  row["kisi_id"],
        kisi_ad: row["kisi_ad"],
        kisi_no:  row["kisi_no"],
      );
    });
  }

  Future<List<Kisiler>> kisiAra(String arama) async {
    var  db = await DatabaseYardimcisi.dbErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%$arama%'");

    return List.generate(maps.length, (index){
      var row = maps[index];
      return Kisiler(
        kisi_id:  row["kisi_id"],
        kisi_ad: row["kisi_ad"],
        kisi_no:  row["kisi_no"],
      );
    });
  }

  Future<void> sil(int kid) async{
    var  db = await DatabaseYardimcisi.dbErisim();
    await db.delete("kisiler", where: "kisi_id=?", whereArgs: [kid]);
  }
}