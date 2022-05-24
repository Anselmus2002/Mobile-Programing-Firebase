import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProdukFormUI extends StatelessWidget {
  final Map? data;
  final CollectionReference _colRef = FirebaseFirestore.instance.collection('product');

  ProdukFormUI(this.data, { Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data ={};

    return Scaffold(
      appBar: AppBar(title: Text('Form Produk'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: TextEditingController(text: this.data?['kode'] ?? ''),
              decoration: const InputDecoration(label: Text('Kode Produk')),
              onChanged: (s){
                data['kode'] = s;
              },
            ),
            TextFormField(
              controller: TextEditingController(text: this.data?['nama'] ?? ''),
              decoration: const InputDecoration(label: Text('Nama Produk')),
              onChanged: (s){
                data['nama'] = s;
              },
            ),
            ElevatedButton(onPressed: (){
              if(this.data !=null){
                _colRef.doc(this.data!['kode']).update(data).then((_){
                  Navigator.pop(context);
                });
              }else{
                 _colRef.doc(data['kode']).set(data).then((_){
                  Navigator.pop(context);
                });
              }    
            }, child: Text('Simpan'))
          ],
          ),
          ),
    ) ;
  }
}