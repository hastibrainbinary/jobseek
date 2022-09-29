import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Firebaservices {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static Future<void> createData(
      {name, email, date, country, address, String? s}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? users = auth.currentUser;
    final uid = users!.uid;
    print("USER UID $uid");
    DocumentReference documentRefence = fireStore.collection('user').doc(uid);
    Map<String, dynamic> user = {
      "email": email,
      "name": name,
      "date": date,
      "country": country,
      "address": address,
    };
    await documentRefence.set(user).whenComplete(() {
      print('$user Created');
    });
  }

  // void readData(name, email, date,country,address) {
  //   DocumentReference documentReference =
  //   fireStore.collection('user').doc(name);
  //   Map<String, dynamic> user = {
  //     "email": email,
  //     "name": name,
  //     "date": date,
  //     "country": country,
  //     "address": address,
  //   };
  // }

  // static updateData(name, email, date,country,address) {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? users = auth.currentUser;
  //   final uid = users!.uid;
  //   print("USER UID $uid");
  //
  //   DocumentReference documentRefence = fireStore.collection('user').doc(uid);
  //   Map<String, dynamic> user = {
  //     "email": email,
  //     "name": name,
  //     "date": date,
  //     "country": country,
  //     "address": address,
  //   };
  //   documentRefence.update(user).whenComplete(() {
  //     print('$name updated');
  //   });
  // }

  deletedData(username, emailid, password, userUid) {
    DocumentReference documentRefereance =
        fireStore.collection('user').doc(userUid);

    documentRefereance.delete().whenComplete(() {
      print('$username   Deleted');
    });
  }
}

class Company extends StatefulWidget {
  const Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _Email();
}

class _Email extends State<Company> {
  String name = '';
  String email = '';
  String date = '';
  String county = '';
  String address = '';
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  createData() {
    DocumentReference documentRefence = fireStore.collection('user').doc(name);
    Map<String, dynamic> user = {
      'name': name,
      'email': email,
      'date': date,
      'country': county,
      'address': address,
    };
    documentRefence.set(user).whenComplete(() {
      print('$user Created');
    });
  }

  // readData() {
  //   DocumentReference documentReference =
  //   fireStore.collection('user').doc(username);
  //   Map<String, dynamic> user = {
  //     'username': username,
  //     'emailid': emailid,
  //     'password': password,
  //   };
  // }

  updateData() {
    DocumentReference documentRefence =
        fireStore.collection('user').doc(name);
    Map<String, dynamic> user = {
      'name': name,
      'email': email,
      'date': date,
      'country': county,
      'address': address,
    };
    documentRefence.set(user).whenComplete(() {
      print('$name updated');
    });
  }

  deletedData() {
    DocumentReference documentRefereance =
        fireStore.collection('user').doc(name);

    documentRefereance.delete().whenComplete(() {
      print('$name   Deleted');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text("Firbase demo list"),
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(16),
      //   child: ListView(
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(bottom: 8),
      //         child: TextField(
      //           decoration: const InputDecoration(
      //               labelText: 'name',
      //               focusedBorder: OutlineInputBorder(
      //                   borderSide:
      //                   BorderSide(color: Colors.deepOrange, width: 2))),
      //           onChanged: (String name) {
      //             username = name;
      //           },
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(bottom: 8),
      //         child: TextField(
      //             decoration: const InputDecoration(
      //                 labelText: 'email id',
      //                 focusedBorder: OutlineInputBorder(
      //                     borderSide:
      //                     BorderSide(color: Colors.deepOrange, width: 2))),
      //             onChanged: (String emailid) {
      //               this.emailid = emailid;
      //             }),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Expanded(
      //             child: ElevatedButton(
      //               child: Text('create'),
      //               onPressed: () {
      //                 createData();
      //               },
      //               style: ButtonStyle(
      //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //                   RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(18.0),
      //                       side: BorderSide(color: Colors.red)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             child: ElevatedButton(
      //               child: Text('read'),
      //               onPressed: () {
      //                 readData();
      //               },
      //               style: ButtonStyle(
      //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //                   RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(16.0),
      //                       side: BorderSide(color: Colors.red)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             child: ElevatedButton(
      //               child: Text('update'),
      //               onPressed: () {
      //                 Firebaservices.updateData(
      //                   username,
      //                   emailid,
      //                   password,
      //                 );
      //               },
      //               style: ButtonStyle(
      //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //                   RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(16.0),
      //                       side: BorderSide(color: Colors.red)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             child: ElevatedButton(
      //               child: Text('Deleted'),
      //               onPressed: () {
      //                 deletedData();
      //               },
      //               style: ButtonStyle(
      //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //                   RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(18.0),
      //                       side: BorderSide(color: Colors.red)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
