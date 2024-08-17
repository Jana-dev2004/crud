import "package:database_/services/auth_service.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool load=false;
  TextEditingController names =TextEditingController();
    TextEditingController password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login",style:TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold
        )),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: names,
              decoration: InputDecoration(
                labelText: "Enter the name",
                border: OutlineInputBorder(  )
              ),
            ),
            SizedBox(height:20),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: "Enter the password",
                border: OutlineInputBorder( )
              ),
            ),
            SizedBox(height:20),
            load?CircularProgressIndicator():
            Container(
              height: 20,
              width:MediaQuery.of(context).size.width,
            child: ElevatedButton(onPressed: ()async{
              setState(() {
                load=true;
              });
                 if(names.text==""||password.text=="")
                 {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields are required")));
                 }
                 
                 else{
                  User? result=await AuthService().login(names.text, password.text,context);
                  if(result!=null)
                  {
                    print("Success");
                    print(result.email);
                  }
                  setState(() {
                    load=false;
                  });
                 }
            }, child:Text("Submit",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            )
            )
        
          ],
        ),
      )
    );
  }
}