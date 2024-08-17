import 'package:flutter/material.dart';
class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page",style:TextStyle(fontSize: 20),),
        actions: [
          TextButton(onPressed: (){}, child:Icon(Icons.sign_language_outlined))
        ],
      ),
    );
  }
}