import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FireStoreUserService {

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<String> insertUser(
      String userId,
      String fullName,
      String email,
      String mobNum,
      ) async {
    try{
      await fireStore.collection('users').doc(userId).set({
        'id': userId,
        'name': fullName,
        'email': email.toLowerCase().trim(),
        'mobileNumber' : mobNum.trim(),
        'createdAt': Timestamp.now().millisecondsSinceEpoch,
      });
      return 'success';
    }catch(e){
      if (kDebugMode) {
        print('fireStore catch error ---> $e');
      }
      return 'failed';
    }


  }

}