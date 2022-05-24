import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan7/UI/produk_form_ui.dart';

class ProdukUI extends StatelessWidget{
  final FirebaseFirestore _ff = FirebaseFirestore.instance;
  late CollectionReference _colRef;

  ProdukUI({ Key? key}):super(key: key){
    _colRef = _ff.collection('product');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text('List Produk'),
     ),
     floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.add),
       onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (c)=>ProdukFormUI(null)));
       },), 
     body: StreamBuilder<QuerySnapshot>(
       stream: _colRef.snapshots(),
       builder: (c,snap)=>ListView(
         children: [
           for(var d in snap.data?.docs ??[])
           Builder(builder: (c){
             var data = d.data();
             return ListTile(
               onLongPress: (){
                 showCupertinoDialog(context: context, 
                 builder: (c)=>CupertinoAlertDialog(
                   title: const Text('Hapus Data'),
                   content: Text('Data Produk kode ${data['kode']} akan dihapus'),
                   actions: [
                     CupertinoDialogAction(child: Text('Ya'),
                     onPressed: (){
                       _colRef.doc(data['kode']).delete();
                       Navigator.pop(c);
                     },
                     ),
                     CupertinoDialogAction(child: Text('Nggak jadi'),
                     onPressed: (){
                       Navigator.pop(c);
                     },
                     ),
                   ],
                 )
                 );
               },
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c){
                    return ProdukFormUI(data);
                  }));
                },
               title: Text('${data['kode']} - ${data['nama']}'),
             );
           })
         ],
       ),
     ),
    );
  }
}