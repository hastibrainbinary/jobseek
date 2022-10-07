import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static Future<void> createData(
      {firstName,
      lastName,
      email,
      phoneNumber,
      city,
      country,
      state,
      String? s}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? users = auth.currentUser;
    final uid = users!.uid;
    if (kDebugMode) {
      print("USER UID $uid");
    }
    DocumentReference documentRefence = FirebaseFirestore.instance
        .collection("Auth")
        .doc("Manager")
        .collection("register")
        .doc("taru uid");
    Map<String, dynamic> user = {
      'FirstName': firstName,
      'LastName': lastName,
      'email': email,
      'PhoneNumber': phoneNumber,
      'city': city,
      'country': country,
      'state': state,
    };
    await documentRefence.set(user).whenComplete(() {
      if (kDebugMode) {
        print('$user Created');
      }
    });
  }

  void readData(
    firstName,
    lastName,
    email,
    phoneNumber,
    city,
    country,
    state,
  ) {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Auth")
        .doc("Manager")
        .collection("register")
        .doc("taru uid");
    Map<String, dynamic> user = {
      'FirstName': firstName,
      'LastName': lastName,
      'email': email,
      'PhoneNumber': phoneNumber,
      'city': city,
      'country': country,
      'state': state,
    };
  }

  // static updateData(name, email, date, country, address) {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? users = auth.currentUser;
  //   final uid = users!.uid;
  //   if (kDebugMode) {
  //     print("USER UID $uid");
  //   }
  //
  //   DocumentReference documentRefence = FirebaseFirestore.instance
  //       .collection("Auth")
  //       .doc("Manager")
  //       .collection("register")
  //       .doc("taru uid");
  //   Map<String, dynamic> user = {
  //     "email": email,
  //     "name": name,
  //     "date": date,
  //     "country": country,
  //     "address": address,
  //   };
  //   documentRefence.update(user).whenComplete(() {
  //     if (kDebugMode) {
  //       print('$name updated');
  //     }
  //   });
  // }

  // deletedData(username, emailid, password, userUid) {
  //   DocumentReference documentRefereance =
  //   FirebaseFirestore.instance
  //       .collection("Auth")
  //       .doc("Manager")
  //       .collection("register")
  //       .doc("taru uid");
  //
  //   documentRefereance.delete().whenComplete(() {
  //     if (kDebugMode) {
  //       print('$username   Deleted');
  //     }
  //   });
  // }
}

class Company extends StatefulWidget {
  const Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _Email();
}

class _Email extends State<Company> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  String city = '';
  String state = '';
  String country = '';
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  createData() {
    DocumentReference documentRefence = FirebaseFirestore.instance
        .collection("Auth")
        .doc("Manager")
        .collection("register")
        .doc("taru uid");
    Map<String, dynamic> user = {
      'FirstName': firstName,
      'LastName': lastName,
      'email': email,
      'PhoneNumber': phoneNumber,
      'city': city,
      'country': country,
      'state': state,
    };
    documentRefence.set(user).whenComplete(() {
      print('$user Created');
    });
  }

  readData() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Auth")
        .doc("Manager")
        .collection("register")
        .doc("taru uid");

    Map<String, dynamic> user = {
      'FirstName': firstName,
      'LastName': lastName,
      'email': email,
      'PhoneNumber': phoneNumber,
      'city': city,
      'country': country,
      'state': state,
    };
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.blueGrey,
        //   title: Text("Firbase demo list"),
        // ),
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
