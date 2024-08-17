import 'package:cloud_firestore/cloud_firestore.dart';

class Database
{
  Future adduser(String id,Map<String,dynamic>details)async{
    return await FirebaseFirestore.instance.collection("Details").doc(id).set(details);
  }
  Future<Stream<QuerySnapshot>> readuser()async{
    return await FirebaseFirestore.instance.collection("details").snapshots();
  }
  Future update(String id,Map<String,dynamic>udetails)async{
    return await FirebaseFirestore.instance.collection("details").doc(id).update(udetails);
  }
  Future delete(String id)async{
    return await FirebaseFirestore.instance.collection("details").doc(id).delete();
  }
}