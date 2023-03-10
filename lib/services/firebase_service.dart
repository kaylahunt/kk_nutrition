import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaylaknows_nutrition/services/user_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseService();

  Future<UserModel> getUser() async {
    var firebaseUser = _auth.currentUser!;
    return UserModel(firebaseUser.uid, displayName: firebaseUser.email!);
  }

  Future<UserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    var authresult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return UserModel(authresult.user!.uid,
        displayName: authresult.user!.displayName.toString());
  }

}
