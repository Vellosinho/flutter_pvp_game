import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:projeto_gbb_demo/models/message.dart';

class DatabaseService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  
  Future<void> sendMessage(String id, Message message) async {
    // print(message.toMap());
    try {
      final DatabaseReference ref = _database.ref();

      await ref.child('users').child('cuca@teste.com').set(message.toMap());
    } catch(e) {
      print(e);
    }
  }
}
