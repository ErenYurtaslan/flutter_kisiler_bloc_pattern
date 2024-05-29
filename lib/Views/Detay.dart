import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kisiler_bloc_pattern/Views/Anasayfa.dart';
import 'package:flutter_kisiler_bloc_pattern/cubit/DetayCubit.dart';
import 'package:flutter_kisiler_bloc_pattern/entity/Kisiler.dart';

// ignore: must_be_immutable
class Detay extends StatefulWidget {
   Kisiler kisi;

   Detay({super.key,required this.kisi});


  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {

  var ad = TextEditingController();
  var no = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ad.text = widget.kisi.kisi_ad;
    no.text = widget.kisi.kisi_no;
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:  const Text("Detay",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              TextField(controller: ad, decoration: const InputDecoration(hintText: "Kişi Adı"),),

              TextField(controller: no, decoration: const InputDecoration(hintText: "Kişi No"),),

              ElevatedButton(
                  onPressed: (){
                    context.read<DetayCubit>().guncelle(widget.kisi.kisi_id, ad.text, no.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Anasayfa()));
                  }, child: const Text("Güncelle")),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>KisiKayit()));
        },
        child: Icon(Icons.add_card_sharp),
      ),
    );
  }
}
