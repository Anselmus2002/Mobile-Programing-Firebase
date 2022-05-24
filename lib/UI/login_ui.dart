import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan7/UI/produk_ui.dart';
import 'package:pertemuan7/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:((context) => AuthProvider()),
      builder: (context, w){
    return Scaffold(
      body: Center(
        child: Consumer<AuthProvider>(
          builder: (context, prov, w) {
        return ElevatedButton.icon(
          onPressed: (){
            prov.auth().then((user){
              if(user !=null){
                Navigator.push(context, MaterialPageRoute(builder: (c)=>ProdukUI()));
              }
            });
          },icon: const Icon(Icons.key),
            label: const Text('Login')
                  );
                }
              ),
            ),
          );
        }
      );
    }
  }