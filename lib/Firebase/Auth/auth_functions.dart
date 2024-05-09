import 'package:firebase_auth/firebase_auth.dart';
import 'package:lets_chat/Firebase/Firestore/user_functions.dart';

class FirebaseAuthService {
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

final FireStoreUserService fireStoreUserService = FireStoreUserService();

  Future<int> signIn(String email, String password) async {
  try {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    return 200;
  } on FirebaseAuthException catch (error) {
    print('sign in catch error : ${error.toString()}');
    print('sign in catch error : ${error.code}');

    print('sign in catch error : ${error.message}');
    print('sign in catch error : ${error.credential}');
    print('sign in catch error : ${error.tenantId}');
    print('sign in catch error : ${error.code}');
    if (error.code == 'invalid-credential') {
      return 400;
    } else {
      return 500;
    }
  }
}

  Future<int> resetPassword(String email) async {
      try{
        await firebaseAuth.sendPasswordResetEmail(email: email.toLowerCase());
        return 200;
      } on FirebaseAuthException catch (error){
        print('Reset Password error -> ${error.code}');
         return 400;
      }
  }

  Future<int> registerUser(
    String fullName,
    String email,
    String mobNum,
    String password,
    ) async {
  try {
    UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.toLowerCase().trim(),
        password: password.trim()
    );
     await firebaseAuth.currentUser!.sendEmailVerification();

    result.user!.updateDisplayName(fullName);
    result.user!.reload();
    print('sign up res => $result' );
    print('sign up res credential => ${result.credential}' );
    print('sign up res user => ${result.user}');
    print('sign up res additionalUserInfo => ${result.additionalUserInfo}');

    String fsResponse = await fireStoreUserService.insertUser(result.user!.uid, fullName, email, mobNum);

    if(fsResponse == 'success'){
      return 200;
    }
    else{
      return 500;
    }

  } on FirebaseAuthException catch (error) {
    print('sign up catch error : ${error.toString()}');
    print('sign up catch error : ${error.code}');
    if (error.code == 'email-already-in-use') {
      return 400;
    } else {
      return 500;
    }
  }
}



  Future<int> signOut() async {
    try{
      await firebaseAuth.signOut();
      return 200;
    } on FirebaseAuthException catch (e){
      print('logout error --> ${e.code}');
      return 400;
    }
  }

}