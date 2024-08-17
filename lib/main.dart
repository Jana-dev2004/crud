import 'package:database_/firebase_options.dart';
import 'package:database_/home.dart';
import 'package:database_/screens/crud.dart';
import 'package:database_/screens/firstpage.dart';
import 'package:database_/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()
async {
   WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  return runApp(Data());
}
class Data extends StatelessWidget {
  const Data({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Crud(),
    );
  }
}