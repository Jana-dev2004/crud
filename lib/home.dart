import "package:database_/login.dart";
import "package:database_/screens/firstpage.dart";
import "package:database_/services/auth_service.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading =false;
  TextEditingController name=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController confirm=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Register",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter the text",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
              TextField(
              controller: pass,
              decoration: InputDecoration(
                hintText: "Enter the password",
                border: OutlineInputBorder()
              ),
            ),
              SizedBox(height: 10,),
              TextField(
              controller: confirm,
              decoration: InputDecoration(
                hintText: "Enter the confirm password",
                border: OutlineInputBorder()
              ),
            ),
              SizedBox(height: 10,),
            loading?CircularProgressIndicator():Container(
                height: 20,
                width:MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: ()async{
                  setState(() {
                    loading=true;
                  });
                 if(name.text==""||pass.text=="")
                 {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields are required")));
                 }
                 else if(pass.text !=confirm.text)
                 {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords doesn't match")));  
                 }
                 else{
                  User? result=await AuthService().Register(name.text, pass.text,context);
                  if(result!=null)
                  {
                    print("Success");
                    print(result.email);
                    Navigator.pushAndRemoveUntil<void>(
    context,
    MaterialPageRoute<void>(builder: (BuildContext context) => const Firstpage()),
    ModalRoute.withName('/'),
  );
   
                  }
                  setState(() {
                    loading=false;
                  });
                 }
                }, child:Text("Submit",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))),
                TextButton(onPressed: (){
                  
                  Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Login(),
    ),
  );
                }, child:Text("Already have a Account",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))
            
          ],
        ),
      ),
    );
  }
}