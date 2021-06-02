import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _usersCollection = _firestore.collection('users');
final CollectionReference _postsCollection = _firestore.collection('posts');

class FirestoreDB {
  static Future<void> register({required Map<String, String> data}) async {
    try {
      final ref = _usersCollection.doc(data["email"]);
      await ref.set(data);
    } catch (e) {
      throw (e);
    }
  }

  static Future<User> login(String email, String password) async {
    final ref = _usersCollection.doc(email);
    final doc = await ref.get();
    User user = User.empty();

    if (doc.exists) {
      user = User.fromDocSnapshot(doc);
    }
    return user;
  }
}

class User {
  String firstName;
  String lastName;
  String email;
  String password;

  User(
      {this.firstName = '',
      this.lastName = "",
      this.email = "",
      this.password = ""});

  User.empty() : this();

  bool get isValid =>
      this.firstName.isNotEmpty &&
      this.lastName.isNotEmpty &&
      this.email.isNotEmpty &&
      this.password.isNotEmpty;

  factory User.fromDocSnapshot(DocumentSnapshot doc) {
    return User(
      firstName: doc["firstname"],
      lastName: doc["lastname"],
      email: doc["email"],
      password: doc["password"],
    );
  }

  @override
  String toString() {
    return ''
        // 'id - $id, '
        'firstname - $firstName, '
        'lastname - $lastName, '
        'email - $email, '
        'password - $password, ';
  }
}
