import 'package:database_/services/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  TextEditingController name=TextEditingController();
  TextEditingController rollno=TextEditingController();
  void user()async
  {
    String id=randomAlphaNumeric(10);
    Map<String,dynamic>details={
      "Name":name.text,
      "Rollno":rollno.text,
    };
    await Database().adduser(id, details);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Suucessfully")));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: Scaffold(
          backgroundColor:Color.fromARGB(255, 2, 9, 100),
          appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 9, 100),
        title: Text("Crud Operation",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
      ),
    body:Container(
      child: Column(
        children: [
            Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),),
          Container(
            child:TextField(
              controller: name,
                  decoration: InputDecoration(
                    hintText: "Enter the name",
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none
                  ),
                )
             ),
             SizedBox(height: 20,),
               Text("Roll no",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),),
          Container(
            child:TextField(
              controller: rollno,
                  decoration: InputDecoration(
                    hintText: "Enter the Rollono",
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none
                  ),
                )
             ),
             SizedBox(height: 20,),
             ElevatedButton(onPressed: (){
              user();
              
             }, child:Text("Submit"))
          
        ],
      ),
    )
      ),
    );
  }
}