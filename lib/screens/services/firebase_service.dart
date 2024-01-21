import 'package:charge_mate/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  var db = FirebaseFirestore.instance;

  Future<String> createUser(name, phone, email, password) async {
    try {
      bool isUnique = await isEmailUnique(email);
      if (isUnique) {
        final users = db.collection('users');
        users.doc().set({
          'name': name,
          'phoneNo': phone,
          'email': email,
          'password': password
        });
      } else {
        return "Username is not unique";
      }
    } catch (e) {
      print("error when checking the email uniqueness");
    }
    return "success";
  }

  Future<QuerySnapshot<Map<String, dynamic>>> login(
      String email, String password) async {
    return db
        .collection("users")
        .where(
          "email",
          isEqualTo: email,
        )
        .where("password", isEqualTo: password)
        .get();
  }

  Future<bool> isEmailUnique(String email) async {
    var querySnapshot =
        await db.collection("users").where('email', isEqualTo: email).get();
    bool isUnique = querySnapshot.docs.isEmpty;
    return isUnique;
  }
}
